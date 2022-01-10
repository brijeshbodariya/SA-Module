import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:smartkit/integration/PaymentGateway/Stripe/payment_card.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/Constant.dart';
import 'package:stripe_payment/stripe_payment.dart';

import 'Stripe_Service.dart';
import 'dialogs.dart';
import 'input_formatters.dart';

String cardnamehint = 'What name is written on card ?';
String cardnohint = 'What number is written on card?';
String lblcardname = 'Card Name';
String cardno = 'Card Number';

class StripeChargeCardMethod extends StatefulWidget {
  final double amount;
  final Function callback;
  final bool payviachargecard;
  const StripeChargeCardMethod({Key key, this.amount, this.payviachargecard, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new StripeChargeCardState(amount);
  }
}

class StripeChargeCardState extends State<StripeChargeCardMethod> {
  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var nameController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidate = false;
  bool showLoader = false;

  //var _card = new PaymentCard();

  final String _currentSecret = Constant.stripeSeckey;
  final String _pubkey = Constant.stripePubkey;
  final String _paymode = Constant.stripeMode;
  bool loadingorder = false;

  double amount;

  StripeChargeCardState(double amount) {
    this.amount = amount;
  }

  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(StripeOptions(
        publishableKey: _pubkey,
        //merchantId: _merchantId,
        androidPayMode: _paymode));

    _paymentCard.type = CardType.Others;
    numberController.addListener(_getCardTypeFrmNumber);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: stripedebitCartWidget());
  }

  stripedebitCartWidget() {
    return Form(
        key: _formKey,
        //autovalidate: _autoValidate,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: <Widget>[
            new TextFormField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              controller: nameController,
              decoration: new InputDecoration(
                border: UnderlineInputBorder(),
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                hintText: cardnamehint,
                labelText: lblcardname,
              ),
              onSaved: (String value) {
                _paymentCard.name = value;
              },
              validator: (value) => value.trim().isEmpty ? "Enter Card Name" : null,
            ),
            new TextFormField(
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), new LengthLimitingTextInputFormatter(19), new CardNumberInputFormatter()],
              controller: numberController,
              decoration: new InputDecoration(
                border: UnderlineInputBorder(),
                icon: CardUtils.getCardIcon(_paymentCard.type),
                hintText: cardnohint,
                labelText: cardno,
              ),
              onSaved: (String value) {
                _paymentCard.number = CardUtils.getCleanedNumber(value);
              },
              validator: CardUtils.validateCardNum,
            ),
            Row(
              children: [
                Expanded(
                    child: new TextFormField(
                  cursorColor: Colors.black,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), new LengthLimitingTextInputFormatter(4), new CardMonthInputFormatter()],
                  decoration: new InputDecoration(
                    //border: UnderlineInputBorder(),
                    icon: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.black,
                    ),
                    hintText: 'MM/YY',
                    labelText: 'Expiry Date',
                  ),
                  validator: CardUtils.validateDate,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    List<int> expiryDate = CardUtils.getExpiryDate(value);
                    _paymentCard.month = expiryDate[0];
                    _paymentCard.year = expiryDate[1];
                  },
                )),
                Expanded(
                    child: new TextFormField(
                  cursorColor: Colors.black,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    new LengthLimitingTextInputFormatter(4),
                  ],
                  decoration: new InputDecoration(
                    //border: UnderlineInputBorder(),
                    icon: Icon(
                      Icons.card_membership,
                      color: Colors.black,
                    ),
                    hintText: 'Number behind the card',
                    labelText: 'CVV',
                  ),
                  validator: CardUtils.validateCVV,
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _paymentCard.cvv = int.parse(value);
                  },
                )),
              ],
            ),
            new SizedBox(
              height: 50.0,
            ),
            if (loadingorder) new CircularProgressIndicator(),
            new Container(
              alignment: Alignment.center,
              child: _getPayButton(),
            )
          ],
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    numberController.removeListener(_getCardTypeFrmNumber);
    numberController.dispose();
    super.dispose();
  }

  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    if (!loadingorder) {
      final FormState form = _formKey.currentState;
      if (!form.validate()) {
        setState(() {
          _autoValidate = true;
        });
      } else {
        form.save();

        createPaymentToken();
      }
    }
  }

  Widget _getPayButton() {
    if (Platform.isIOS) {
      return new CupertinoButton(
        onPressed: _validateInputs,
        color: ColorsRes.appcolor,
        child: Text(
          "Pay\t" + Constant.currencysymbol + amount.toString(),
          style: TextStyle(fontSize: 17.0),
        ),
      );
    } else {
      return new ElevatedButton(
        onPressed: _validateInputs,
        style: ElevatedButton.styleFrom(
          onPrimary: ColorsRes.white,
          onSurface: ColorsRes.grey,
          primary: Colors.black,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
        ),
        child: new Text(
          "Pay\t" + Constant.currencysymbol + amount.toString(),
          style: TextStyle(fontSize: 17.0),
        ),
      );
    }
  }

  Future<void> createPaymentToken() async {
    if (!loadingorder)
      setState(() {
        loadingorder = true;
      });

    setLoadingState(true);

    final CreditCard testCard = CreditCard(
      name: _paymentCard.name,
      number: _paymentCard.number,
      cvc: _paymentCard.cvv.toString(),
      expMonth: _paymentCard.month,
      expYear: _paymentCard.year,
    );

    if (widget.payviachargecard) {
      StripePayment.createTokenWithCard(
        testCard,
      ).then((token) async {
        setLoadingState(true);

        await createCharge(token.tokenId);

        setLoadingState(false);
      }).catchError(setError);
    } else {
      var dataresponse = await StripeService.payWithCard(amount: (amount * 100).toInt().toString(), currency: Constant.currencyname.toLowerCase(), card: testCard);

      setLoadingState(false);

      setState(() {
        loadingorder = false;
      });

      if (dataresponse.success) {
        widget.callback(dataresponse.stripePayId, "Success");
      } else {
        widget.callback("", "Failed");
      }
    }
  }

  Future<Map<String, dynamic>> createCharge(String tokenId) async {
    print("chargemethod");
    if (!loadingorder)
      setState(() {
        loadingorder = true;
      });
    //double amountpay = double.parse(amount)  * 100;
    try {
      Map<String, dynamic> body = {'amount': (amount * 100).toInt().toString(), 'currency': Constant.currencyname.toLowerCase(), 'source': tokenId, 'description': 'SmartKit-${DateTime.now().millisecondsSinceEpoch}'};
      var response = await http.post(Uri.parse('https://api.stripe.com/v1/charges'), body: body, headers: {'Authorization': 'Bearer $_currentSecret', 'Content-Type': 'application/x-www-form-urlencoded'});
      print("---res--code--${response.statusCode}");
      print("---res--card--${response.body.toString()}");

      int responseCode = response.statusCode;
      final res = json.decode(response.body.toString());
      setLoadingState(false);

      setState(() {
        loadingorder = false;
      });

      if (200 > responseCode || responseCode > 299) {
      } else {
        String txnid;
        if (res['id'] != null) {
          txnid = res['id'];
        } else if (res['balance_transaction'] != null) {
          txnid = res['balance_transaction'];
        } else {
          txnid = tokenId;
        }

        widget.callback(txnid, "Success");
      }
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
      widget.callback("", "Failed");
    }
    return null;
  }

  void setError(dynamic error) {
    if (this.showLoader)
      setState(() {
        this.showLoader = false;
      });
    Dialogs.showInfoDialog(context, error.toString());
  }

  @override
  void onApiFailure(String statusCode, String message) {
    //print("LOGIN SCREEN -> FAILURE : " + message);
    setLoadingState(false);
    Dialogs.showInfoDialog(context, message);
  }

  @override
  void onException() {
    //print("LOGIN SCREEN -> NO EXCEPTION");
    setLoadingState(false);
  }

  @override
  void onNoInternetConnection() {
    //print("LOGIN SCREEN -> NO INTERNET");
    setLoadingState(false);
    Dialogs.showInfoDialog(context, "Check Internet Connection");
  }

  @override
  void setLoadingState(bool isShow) {
    setState(() {
      this.showLoader = isShow;
    });
  }
}
