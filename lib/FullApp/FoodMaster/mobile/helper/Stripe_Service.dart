// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

// import 'package:stripe_payment/stripe_payment.dart';

// import 'dart:math';

// import 'Constant.dart';

// class StripeTransactionResponse {
//   final String message, status, stripePayId;
//   bool success;
//   StripeTransactionResponse(
//       {this.message, this.success, this.status, this.stripePayId});
// }

// class StripeService {
//   static String apiBase = 'https://api.stripe.com/v1';
//   static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';
//   static String secret = Constant.stripeSeckey;
//   static String pubkey = Constant.stripePubkey;
//   static String stripeMode = "test";

//   static Map<String, String> headers = {
//     'Authorization': 'Bearer ${StripeService.secret}',
//     'Content-Type': 'application/x-www-form-urlencoded'
//   };

//   static init() {
//     StripePayment.setOptions(StripeOptions(
//         publishableKey: pubkey,
//         merchantId: "Test",
//         androidPayMode: stripeMode));
//   }

//   static Future<StripeTransactionResponse> payViaExistingCard(
//       {String amount, String currency, CreditCard card}) async {
//     try {
//       var paymentMethod = await StripePayment.createPaymentMethod(
//           PaymentMethodRequest(card: card));
//       var paymentIntent =
//           await StripeService.createPaymentIntent(amount, currency);

//       String stripePayId = paymentIntent['id'];
//       print("response--1--${paymentIntent.toString()}");
//       var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
//           clientSecret: paymentIntent['client_secret'],
//           paymentMethodId: paymentMethod.id));

//       if (response.status == 'succeeded' ||
//           response.status == 'pending' ||
//           response.status == 'captured') {
//         return new StripeTransactionResponse(
//             message: 'Transaction successful',
//             success: true,
//             status: response.status,
//             stripePayId: stripePayId);
//       } else {
//         return new StripeTransactionResponse(
//             message: 'Transaction failed',
//             success: false,
//             status: response.status,
//             stripePayId: stripePayId);
//       }
//     } on PlatformException catch (err) {
//       return StripeService.getPlatformExceptionErrorResult(err);
//     } catch (err) {
//       return new StripeTransactionResponse(
//           message: 'Transaction failed: ${err.toString()}',
//           success: false,
//           status: "fail",
//           stripePayId: "");
//     }
//   }

//   static Future<StripeTransactionResponse> payWithNewCard(
//       {String amount, String currency}) async {
//     try {
//       var paymentMethod = await StripePayment.paymentRequestWithCardForm(
//           CardFormPaymentRequest());

//       var paymentIntent = await StripeService.createPaymentIntent(
//         amount,
//         currency,
//       );

//       String stripePayId = paymentIntent['id'];

//       print("response--1--${paymentIntent.toString()}");

//       var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
//         clientSecret: paymentIntent['client_secret'],
//         paymentMethodId: paymentMethod.id,
//       ));

//       if (response.status == 'succeeded') {
//         return new StripeTransactionResponse(
//             message: 'Transaction successful',
//             success: true,
//             status: response.status,
//             stripePayId: stripePayId);
//       } else if (response.status == 'pending' ||
//           response.status == "captured") {
//         return new StripeTransactionResponse(
//             message: 'Transaction pending',
//             success: true,
//             status: response.status,
//             stripePayId: stripePayId);
//       } else {
//         return new StripeTransactionResponse(
//             message: 'Transaction failed',
//             success: false,
//             status: response.status,
//             stripePayId: stripePayId);
//       }
//     } on PlatformException catch (err) {
//       return StripeService.getPlatformExceptionErrorResult(err);
//     } catch (err) {
//       return new StripeTransactionResponse(
//           message: 'Transaction failed: ${err.toString()}',
//           success: false,
//           status: "fail",
//           stripePayId: "");
//     }
//   }

//   static getPlatformExceptionErrorResult(err) {
//     String message = 'Something went wrong';
//     if (err.code == 'cancelled') {
//       message = 'Transaction cancelled';
//     }

//     return new StripeTransactionResponse(
//         message: message, success: false, status: "cancelled");
//   }

//   static Future<Map<String, dynamic>> createPaymentIntent(
//       String amount, String currency) async {
//     String orderId =
//         "order--${DateTime.now().millisecondsSinceEpoch}-${Random().nextInt(900) + 100}";

//     try {
//       Map<String, dynamic> body = {
//         'amount': amount,
//         'currency': currency,
//         'payment_method_types[]': 'card',
//         'metadata[order_id]': orderId
//       };

//       var response = await http.post(StripeService.paymentApiUrl,
//           body: body, headers: StripeService.headers);
//       return jsonDecode(response.body);
//     } catch (err) {
//       print('err charging user: ${err.toString()}');
//     }
//     return null;
//   }
// }
