import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:smartkit/integration/helper/Constant.dart';

class PayStackPage extends StatefulWidget {
  double amount;
  Function callback;
  PayStackPage({
    Key key,
    this.amount,
    this.callback,
  }) : super(key: key);
  @override
  _PayStackPageState createState() => _PayStackPageState();
}

class _PayStackPageState extends State<PayStackPage> {
  final plugin = PaystackPlugin();

  CheckoutMethod _method = CheckoutMethod.card;
  bool _inProgress = false;
  String _cardNumber;
  String _cvv;
  int _expiryMonth;
  int _expiryYear;

  @override
  void initState() {
    plugin.initialize(publicKey: Constant.paystackPublicKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: new SingleChildScrollView(
          child: _inProgress
              ? new Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Platform.isIOS ? new CupertinoActivityIndicator() : new CircularProgressIndicator(backgroundColor: Colors.black),
                )
              : new Container(
                  width: double.infinity,
                  child: _getPlatformButton(
                    'Checkout',
                    () => _handleCheckout(context),
                  ),
                )),
    );
  }

  _handleCheckout(BuildContext context) async {
    setState(() => _inProgress = true);

    Charge charge = Charge()
      ..amount = widget.amount.toInt() * 100
      ..email = 'user@email.com'
      ..currency = Constant.paystackCurrency
      ..card = _getCardFromUI();

    charge.reference = _getReference();

    try {
      CheckoutResponse response = await plugin.checkout(
        context,
        method: _method,
        charge: charge,
        fullscreen: false,
        logo: MyLogo(),
      );
      print('Response = $response');
      setState(() => _inProgress = false);

      widget.callback(response.reference ?? '', response.status.toString());
    } catch (e) {
      setState(() => _inProgress = false);

      widget.callback("", "Failed");
      rethrow;
    }
  }

  String _getReference() {
    String platform;
    if (Platform.isIOS) {
      platform = 'iOS';
    } else {
      platform = 'Android';
    }

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: _cardNumber,
      cvc: _cvv,
      expiryMonth: _expiryMonth,
      expiryYear: _expiryYear,
    );
  }

  Widget _getPlatformButton(String string, Function() function) {
    /*Widget widget;
    if (Platform.isIOS) {
      widget = new CupertinoButton(
        onPressed: function,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        color: CupertinoColors.activeBlue,
        child: new Text(
          string,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );
    } else {
      widget = new ElevatedButton(
        onPressed: function,
        child: new Text(
          string.toUpperCase(),
          style: const TextStyle(fontSize: 17.0),
        ),
      );
    }
return widget;*/

    return GestureDetector(
        onTap: function,
        child: Row(children: [
          Icon(
            Icons.radio_button_off,
            color: Colors.black,
          ),
          SizedBox(width: 10),
          Text(
            "Pay via Card",
            style: Theme.of(context).textTheme.subtitle1,
          )
        ]));
  }
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(
        "CO",
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
