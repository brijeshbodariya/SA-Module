import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/CartPayment/CartListPageDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/CartPayment/PaymentAddressPageDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/StripeChargeCardMethod.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/dialogs.dart';
import 'package:smartkit/FullApp/FoodMaster/model/payment_card.dart';

import 'Order_PlaceDesktop.dart';

class PaymentPageDesktop extends StatefulWidget {
  final List timeslot;

  const PaymentPageDesktop({Key key, this.timeslot}) : super(key: key);
  @override
  _PaymentPageStateDesktop createState() => _PaymentPageStateDesktop();
}

class _PaymentPageStateDesktop extends State<PaymentPageDesktop> {
  RoundedRectangleBorder cardshape;
  TextStyle headerstyle;
  EdgeInsets cardmargin = EdgeInsets.only(bottom: 10);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String paymentmethod; // = StringsRes.cod;
  bool loadingorder = false;
  double finaltotal = totalcartprice;
  String deliverymethod = checkoutdata["delivery_method"];




  var _formKey = new GlobalKey<FormState>();
  var numberController = new TextEditingController();
  var _paymentCard = PaymentCard();
  var _autoValidate = false;
  bool showLoader = false;

  var _card = new PaymentCard();

  final String _currentSecret = Constant.stripeSeckey;
  final String _pubkey = Constant.stripePubkey;
  final String _merchantId = "test";
  final String _paymode = "test";

  double amount;
  Map checkoutdata1;

  StripeChargeCardState(double amount, GlobalKey<ScaffoldState> scaffoldKey, Map checkoutdata) {
    this.amount = amount;
    this.scaffoldKey = scaffoldKey;
    this.checkoutdata1 = checkoutdata;
  }






  @override
  void initState() {
    super.initState();
    if (deliverymethod == StringsRes.delivery.toLowerCase()) {
      finaltotal = totalcartprice + deliverycost;
    }
  }



  void _getCardTypeFrmNumber() {
    String input = CardUtils.getCleanedNumber(numberController.text);
    CardType cardType = CardUtils.getCardTypeFrmNumber(input);
    setState(() {
      this._paymentCard.type = cardType;
    });
  }

  void _validateInputs() {
    createPaymentToken();
  }

  Widget _getPayButton() {
      return GestureDetector(
        onTap:(){
          callPaymentStatus();
        },
        child: Container(
          padding: EdgeInsets.only(top: 13, bottom: 13),
          margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          alignment: Alignment.center,
          decoration: DesignConfig.buttonShadow(ColorsRes.appcolor, 30, ColorsRes.appcolor),
          child: new Text(
            StringsRes.pay + " " + Constant.currencysymbol + finaltotal.toString(),
            style: TextStyle(fontSize: 17.0,color: ColorsRes.white),
          ),
        ),
      );
  }


  createPaymentToken() async {
    //setLoadingState(true);
    final PaymentCard testCard = PaymentCard(
      name: _card.name,
      number: _paymentCard.number,
      cvv: _paymentCard.cvv,
      month: _paymentCard.month,
      year: _paymentCard.year,
      /*cvc: '123',
       expMonth: 12,
       expYear: 21,*/
      /*country: 'US',
        addressCity: 'Kansas',
        addressState: 'Kansas',
        addressZip: '60007',
        addressLine1: 'adcsafsadf',
        addressLine2: 'dadada',
        addressCountry: 'US'*/
    );

    /* if (widget.payviachargecard) {
       StripePayment.createTokenWithCard(
         testCard,
       ).then((token) {
         setLoadingState(true);*/
    //WebServices(context, this).callapiPaymentCharge(token.tokenId, constant.EMAIL, constant.AMOUNT, constant.CURRENCY);
    createCharge();
    //print("tokenId-" + token.tokenId);
    /* }).catchError(setError);
     }*/ /* else {
      var dataresponse = await StripeService.payViaExistingCard(
           amount: (amount * 100).toInt().toString(),
           currency: Constant.currencyname.toLowerCase(),
           card: testCard);

       setLoadingState(false);

       if (dataresponse.success) {
         widget.callback(dataresponse.stripePayId);
       }}*/
    //  }
  }

  Future<Map<String, dynamic>> createCharge() async {
    scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(StringsRes.transactionsuccess)));
  }

  void setError(dynamic error) {
    if (this.showLoader)
      setState(() {
        this.showLoader = false;
      });
    Dialogs.showInfoDialog(context, error.toString(), onPressed: null);
  }





  @override
  Widget build(BuildContext context) {
    cardshape = DesignConfig.setRoundedBorder(ColorsRes.white, 10, false);
    headerstyle = Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold));

    return Scaffold(
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.lblpayment),
      bottomNavigationBar: ButtonClickAnimation(
        onTap: () {
          callPaymentStatus();
        },
        child: IntrinsicHeight(
          child: paymentmethod != StringsRes.stripe.toLowerCase()?Container(
            padding: EdgeInsets.only(top: 13, bottom: 13),
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            alignment: Alignment.center,
            decoration: DesignConfig.buttonShadow(ColorsRes.appcolor, 30, ColorsRes.appcolor),
            child: Text(
              StringsRes.placeorder.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
            ),
          ):Container(),
        ),
      ),
      //  : null,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          summaryWidget(),
          paymentTypeWidget(),
          paymentmethod == StringsRes.stripe.toLowerCase()?stripeWidget():Container(),
        ]),
      ),
    );
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
              Text(
                StringsRes.entercarddetails,
                style: headerstyle,
              ),
              SizedBox(height: 10),
              // StripeChargeCardMethod(
              //   amount: finaltotal,
              //   scaffoldKey: scaffoldKey,
              //   checkoutdata: checkoutdata,
              //   callback: callPaymentStatus,
              //   payviachargecard: false,
              // ),
              Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: <Widget>[
                      new TextFormField(
                        keyboardType: TextInputType.number,
                        /* inputFormatters: [
                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                 new LengthLimitingTextInputFormatter(19),
                 new CardNumberInputFormatter()
               ],*/
                        controller: numberController,
                        decoration: new InputDecoration(
                          border: UnderlineInputBorder(),
                          icon: CardUtils.getCardIcon(_paymentCard.type),
                          hintText: StringsRes.cardnohint,
                          labelText: StringsRes.cardno,
                        ),
                        onSaved: (String value) {
                          _paymentCard.number = CardUtils.getCleanedNumber(value);
                        },
                        // validator: CardUtils.validateCardNum,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: new TextFormField(
                                /* inputFormatters: [
                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                     new LengthLimitingTextInputFormatter(4),
                     new CardMonthInputFormatter()
                   ],*/
                                decoration: new InputDecoration(
                                  //border: UnderlineInputBorder(),
                                  icon: Icon(Icons.calendar_today_outlined),
                                  hintText: 'MM/YY',
                                  labelText: 'Expiry Date',
                                ),
                                // validator: CardUtils.validateDate,
                                keyboardType: TextInputType.number,
                                onSaved: (value) {
                                  List<int> expiryDate = CardUtils.getExpiryDate(value);
                                  _paymentCard.month = expiryDate[0];
                                  _paymentCard.year = expiryDate[1];
                                },
                              )),
                          Expanded(
                              child: new TextFormField(
                                /*inputFormatters: [
                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                     new LengthLimitingTextInputFormatter(4),
                   ],*/
                                decoration: new InputDecoration(
                                  //border: UnderlineInputBorder(),
                                  icon: Icon(Icons.card_membership),
                                  hintText: 'Number behind the card',
                                  labelText: 'CVV',
                                ),
                                // validator: CardUtils.validateCVV,
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
                      paymentmethod == StringsRes.stripe.toLowerCase()?new Container(
                        alignment: Alignment.center,
                        child: _getPayButton(),
                      ):Container()
                    ],
                  )),
            ],
          ),
        ));
  }

  summaryWidget() {
    return Card(
        margin: cardmargin,
        shape: cardshape,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringsRes.summary,
                style: headerstyle,
              ),
              Text(
                "${StringsRes.deliverymethod} : ${Constant.setFirstLetterUppercase(deliverymethod)}",
              ),
              Text(
                "${StringsRes.lbltime} : ${widget.timeslot}",
              ),
              if (deliverymethod == StringsRes.delivery.toLowerCase())
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "${StringsRes.address} : ${deliveryaddressinfo.address}",
                  ),
                ),
              Text(
                StringsRes.lblfooditems,
                style: headerstyle,
              ),
              Text(cartitems.skip(7).join("\n")),
              Divider(),
              if (deliverymethod == StringsRes.delivery.toLowerCase())
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    StringsRes.lblsubtotal,
                  ),
                  Text(
                    "${Constant.currencysymbol}${totalcartprice.toStringAsFixed(2)}",
                  ),
                ]),
              if (deliverymethod == StringsRes.delivery.toLowerCase())
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Text(
                    StringsRes.lbldelivery,
                  ),
                  Text(
                    "${Constant.currencysymbol}${deliverycost.toStringAsFixed(2)}",
                  ),
                ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  StringsRes.lbltotal,
                  style: headerstyle,
                ),
                Text(
                  "${Constant.currencysymbol}${finaltotal.toStringAsFixed(2)}",
                  style: headerstyle,
                ),
              ]),
            ],
          ),
        ));
  }

  Widget paymentTypeWidget() {
    return Card(
      margin: cardmargin,
      shape: cardshape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              StringsRes.paymentmethod,
              style: headerstyle,
            ),
            //  if (Constant.enablecod)
            GestureDetector(
              onTap: () {
                setState(() {
                  paymentmethod = StringsRes.cod.toLowerCase();
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(children: [
                  Icon(
                    StringsRes.cod.toLowerCase() == paymentmethod ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: StringsRes.cod.toLowerCase() == paymentmethod ? ColorsRes.IconColor : ColorsRes.grey,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    StringsRes.cashondelivery,
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
                  CachedNetworkImage(
                    imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/cash-on-delivery.png",
                    height: 30,
                    width: 30,
                  ),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  paymentmethod = StringsRes.stripe.toLowerCase();
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(children: [
                  Icon(
                    StringsRes.stripe.toLowerCase() == paymentmethod ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: StringsRes.stripe.toLowerCase() == paymentmethod ? ColorsRes.IconColor : ColorsRes.grey,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    StringsRes.paywithcard,
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
                  CachedNetworkImage(
                    imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/credit-card.png",
                    height: 30,
                    width: 30,
                  ),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  paymentmethod = StringsRes.pal.toLowerCase();
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(children: [
                  Icon(
                    StringsRes.pal.toLowerCase() == paymentmethod ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: StringsRes.pal.toLowerCase() == paymentmethod ? ColorsRes.IconColor : ColorsRes.grey,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    StringsRes.PayPal,
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
                  SvgPicture.network(
                    "https://smartkit.wrteam.in/smartkit/foodmaster/paypal.svg",
                    fit: BoxFit.fitHeight,
                    height: 30,
                    width: 60,
                  ),
                ]),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  paymentmethod = StringsRes.paytm.toLowerCase();
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(children: [
                  Icon(
                    StringsRes.paytm.toLowerCase() == paymentmethod ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: StringsRes.paytm.toLowerCase() == paymentmethod ? ColorsRes.IconColor : ColorsRes.grey,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Text(
                    StringsRes.Paytm,
                    style: Theme.of(context).textTheme.subtitle1,
                  )),
                  SvgPicture.network(
                    "https://smartkit.wrteam.in/smartkit/foodmaster/paytm.svg",
                    fit: BoxFit.contain,
                    height: 30,
                    width: 70,
                  ),
                ]),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Future callPaymentStatus() async {
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => Order_PlaceDesktop()));
    setState(() {
      loadingorder = false;
    });
  }
}
