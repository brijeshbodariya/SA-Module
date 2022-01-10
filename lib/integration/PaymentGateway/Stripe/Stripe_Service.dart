import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:smartkit/integration/helper/Constant.dart';

import 'package:stripe_payment/stripe_payment.dart';

import 'dart:math';

class StripeTransactionResponse {
  final String message, status, stripePayId;
  bool success;
  StripeTransactionResponse({this.message, this.success, this.status, this.stripePayId});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
  static String secret = Constant.stripeSeckey;
  static String pubkey = Constant.stripePubkey;
  static String stripeMode = Constant.stripeMode;

  static Map<String, String> headers = {'Authorization': 'Bearer ${StripeService.secret}', 'Content-Type': 'application/x-www-form-urlencoded'};

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey: pubkey,
        //merchantId: "Test",
        androidPayMode: stripeMode));
  }

  static Future<StripeTransactionResponse> payWithCard({String amount, String currency, CreditCard card}) async {
    print("paymentintent");
    try {
      var paymentMethod = await StripePayment.createPaymentMethod(PaymentMethodRequest(card: card));
      var paymentIntent = await StripeService.createPaymentIntent(amount, currency);
      print("response--1--${paymentIntent.toString()}");

      String stripePayId = paymentIntent['id'];

      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(clientSecret: paymentIntent['client_secret'], paymentMethodId: paymentMethod.id));

      if (response.status == 'succeeded' || response.status == 'pending' || response.status == 'captured') {
        return new StripeTransactionResponse(message: 'Transaction successful', success: true, status: response.status, stripePayId: stripePayId);
      } else {
        return new StripeTransactionResponse(message: 'Transaction failed', success: false, status: response.status, stripePayId: stripePayId);
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(message: 'Transaction failed: ${err.toString()}', success: false, status: "fail", stripePayId: "");
    }
  }

  static getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }

    return new StripeTransactionResponse(message: message, success: false, status: "cancelled");
  }

  static Future<Map<String, dynamic>> createPaymentIntent(String amount, String currency) async {
    String orderId = "order-${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(900) + 100}";

    try {
      Map<String, dynamic> body = {'amount': amount, 'currency': currency, 'payment_method_types[]': 'card', 'metadata[order_id]': orderId};

      var response = await http.post(Uri.parse(StripeService.paymentApiUrl), body: body, headers: StripeService.headers);

      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }
}
