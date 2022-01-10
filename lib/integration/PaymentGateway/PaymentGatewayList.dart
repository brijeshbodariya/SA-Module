import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/Constant.dart';
import 'package:smartkit/integration/helper/DesignConfig.dart';

import 'Flutterwave/FlutterWavePayment.dart';
import 'Paystack/PayStackPage.dart';
import 'Paystack/PaystackGhanaMobMoney.dart';
import 'Stripe/StripeChargeCardMethod.dart';

class PaymentGatewayList extends StatefulWidget {
  @override
  _PaymentGatewayListState createState() => _PaymentGatewayListState();
}

class _PaymentGatewayListState extends State<PaymentGatewayList> {
  EdgeInsets cardmargin = EdgeInsets.only(bottom: 10);
  RoundedRectangleBorder cardshape;
  int stripemethod = 2;
  int flutterwavemethod = 1; //1.mpesa, 2. ghanamobilemoney
  double amount = 50;
  final paystackPlugin = PaystackPlugin();

  Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    paystackPlugin.initialize(publicKey: Constant.paystackPublicKey);

    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("****success");
    callPaymentStatus(response.paymentId, "success");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("****fail");
    callPaymentStatus("", "failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("****wallet");
    callPaymentStatus("", "wallet");
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cardshape = DesignConfig.setRoundedBorder(ColorsRes.white, 10, false);

    return Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: SmartKitAppbar(
          title: "Payment Gateway",
        ),
      ),
      body: ListView(children: [
        ExpansionTile(
          title: new Text(
            "Stripe",
          ),
          children: <Widget>[
            stripeWidget(),
          ],
        ),
        ExpansionTile(
          title: new Text(
            "FlutterWave",
          ),
          children: <Widget>[flutterwaveWidget()],
        ),
        ExpansionTile(
          title: new Text(
            "Paystack",
          ),
          children: <Widget>[
            paystackWidget(),
          ],
        ),
        ExpansionTile(
          title: new Text(
            "Razorpay",
          ),
          onExpansionChanged: (bool val) {
            var options = {
              'key': Constant.razorpayKeyID,
              'amount': 100,
              'name': 'TestUser',
              'description': 'Test payment',
              'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
            };
            try {
              _razorpay.open(options);
            } catch (e) {
              debugPrint(e);
            }
          },
        ),
      ]),
    );
  }

  Widget paystackWidget() {
    return Column(children: [
      PayStackPage(
        amount: amount,
        callback: callPaymentStatus,
      ),
      Container(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => PaystackGhanaMobMoney(
                          amount: amount,
                          callback: callPaymentStatus,
                        ));
              },
              child: Row(children: [
                Icon(
                  Icons.radio_button_off,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Text(
                  "Pay via GhanaMobileMoney",
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ])))
    ]);
  }

  Widget stripeWidget() {
    return Card(
        margin: cardmargin,
        shape: cardshape,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile(
                title: Text('Via Stripe Charge Method'),
                value: 1,
                groupValue: stripemethod,
                onChanged: (int value) {
                  setState(() {
                    stripemethod = value;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Via Stripe Payment Intent'),
                value: 2,
                groupValue: stripemethod,
                onChanged: (int value) {
                  setState(() {
                    stripemethod = value;
                  });
                },
              ),
              SizedBox(height: 10),
              StripeChargeCardMethod(
                amount: amount,
                callback: callPaymentStatus,
                payviachargecard: stripemethod == 1,
              ),
            ],
          ),
        ));
  }

  Widget flutterwaveWidget() {
    return Column(children: [
      RadioListTile(
        title: Text('MPesa'),
        value: 1,
        groupValue: flutterwavemethod,
        onChanged: (int value) {
          setState(() {
            flutterwavemethod = value;
          });
        },
      ),
      RadioListTile(
        title: Text('GhanaMobileMoney'),
        value: 2,
        groupValue: flutterwavemethod,
        onChanged: (int value) {
          setState(() {
            flutterwavemethod = value;
          });
        },
      ),
      FlutterWavePayment(
        amount: amount,
        callback: callPaymentStatus,
        type: flutterwavemethod,
      ),
    ]);
  }

  callPaymentStatus(String txnid, String status) async {
    print("==api-call==$txnid");

    if (txnid.trim().isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Success\nTransactionID = $txnid')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(status)));
    }
  }
}
