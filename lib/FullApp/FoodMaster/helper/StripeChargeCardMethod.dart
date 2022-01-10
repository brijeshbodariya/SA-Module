// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:stripe_payment/stripe_payment.dart';

// import 'package:smartkit/FullApp/FoodMaster/helper/ColorsRes.dart';
// import 'package:smartkit/FullApp/FoodMaster/helper/Constant.dart';
// import 'package:smartkit/FullApp/FoodMaster/model/payment_card.dart';

// import 'StringsRes.dart';
// import 'dialogs.dart';

// class StripeChargeCardMethod extends StatefulWidget {
//   final double amount;
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   final Map checkoutdata;
//   final Function callback;
//   final bool payviachargecard;
//   const StripeChargeCardMethod({Key key, this.amount, this.scaffoldKey, this.checkoutdata, this.payviachargecard, this.callback}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return new StripeChargeCardState(amount, scaffoldKey, checkoutdata);
//   }
// }

// class StripeChargeCardState extends State<StripeChargeCardMethod> {
//   var _formKey = new GlobalKey<FormState>();
//   var numberController = new TextEditingController();
//   var _paymentCard = PaymentCard();
//   var _autoValidate = false;
//   bool showLoader = false;

//   var _card = new PaymentCard();

//   final String _currentSecret = Constant.stripeSeckey;
//   final String _pubkey = Constant.stripePubkey;
//   final String _merchantId = "test";
//   final String _paymode = "test";
//   bool loadingorder = false;

//   double amount;
//   GlobalKey<ScaffoldState> scaffoldKey;
//   Map checkoutdata;

//   StripeChargeCardState(double amount, GlobalKey<ScaffoldState> scaffoldKey, Map checkoutdata) {
//     this.amount = amount;
//     this.scaffoldKey = scaffoldKey;
//     this.checkoutdata = checkoutdata;
//   }

//   @override
//   void initState() {
//     super.initState();
//     StripePayment.setOptions(StripeOptions(
//         publishableKey: _pubkey,
//         //merchantId: _merchantId,
//         androidPayMode: _paymode));

//     _paymentCard.type = CardType.Others;
//     numberController.addListener(_getCardTypeFrmNumber);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(child: stripedebitCartWidget());
//   }

//   stripedebitCartWidget() {
//     return Form(
//         key: _formKey,
//         //autovalidate: _autoValidate,
//         autovalidateMode: AutovalidateMode.always,
//         child: Column(
//           children: <Widget>[
//             new TextFormField(
//               keyboardType: TextInputType.number,
//               /* inputFormatters: [
//                 FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                 new LengthLimitingTextInputFormatter(19),
//                 new CardNumberInputFormatter()
//               ],*/
//               controller: numberController,
//               decoration: new InputDecoration(
//                 border: UnderlineInputBorder(),
//                 icon: CardUtils.getCardIcon(_paymentCard.type),
//                 hintText: StringsRes.cardnohint,
//                 labelText: StringsRes.cardno,
//               ),
//               onSaved: (String value) {
//                 _paymentCard.number = CardUtils.getCleanedNumber(value);
//               },
//               // validator: CardUtils.validateCardNum,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                     child: new TextFormField(
//                   /* inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                     new LengthLimitingTextInputFormatter(4),
//                     new CardMonthInputFormatter()
//                   ],*/
//                   decoration: new InputDecoration(
//                     //border: UnderlineInputBorder(),
//                     icon: Icon(Icons.calendar_today_outlined),
//                     hintText: 'MM/YY',
//                     labelText: 'Expiry Date',
//                   ),
//                   // validator: CardUtils.validateDate,
//                   keyboardType: TextInputType.number,
//                   onSaved: (value) {
//                     List<int> expiryDate = CardUtils.getExpiryDate(value);
//                     _paymentCard.month = expiryDate[0];
//                     _paymentCard.year = expiryDate[1];
//                   },
//                 )),
//                 Expanded(
//                     child: new TextFormField(
//                   /*inputFormatters: [
//                     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
//                     new LengthLimitingTextInputFormatter(4),
//                   ],*/
//                   decoration: new InputDecoration(
//                     //border: UnderlineInputBorder(),
//                     icon: Icon(Icons.card_membership),
//                     hintText: 'Number behind the card',
//                     labelText: 'CVV',
//                   ),
//                   // validator: CardUtils.validateCVV,
//                   keyboardType: TextInputType.number,
//                   onSaved: (value) {
//                     _paymentCard.cvv = int.parse(value);
//                   },
//                 )),
//               ],
//             ),
//             new SizedBox(
//               height: 50.0,
//             ),
//             if (loadingorder) new CircularProgressIndicator(),
//             new Container(
//               alignment: Alignment.center,
//               child: _getPayButton(),
//             )
//           ],
//         ));
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is removed from the Widget tree
//     numberController.removeListener(_getCardTypeFrmNumber);
//     numberController.dispose();
//     super.dispose();
//   }

//   void _getCardTypeFrmNumber() {
//     String input = CardUtils.getCleanedNumber(numberController.text);
//     CardType cardType = CardUtils.getCardTypeFrmNumber(input);
//     setState(() {
//       this._paymentCard.type = cardType;
//     });
//   }

//   void _validateInputs() {
//     createPaymentToken();
//   }

//   Widget _getPayButton() {
//     if (Platform.isIOS) {
//       return new CupertinoButton(
//         onPressed: _validateInputs,
//         color: ColorsRes.appcolor,
//         child: Text(
//           StringsRes.pay + " " + Constant.currencysymbol + amount.toString(),
//           style: TextStyle(fontSize: 17.0),
//         ),
//       );
//     } else {
//       return new RaisedButton(
//         onPressed: _validateInputs,
//         color: ColorsRes.appcolor,
//         splashColor: ColorsRes.appcolor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(100.0)),
//         ),
//         padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 80.0),
//         textColor: Colors.white,
//         child: new Text(
//           StringsRes.pay + " " + Constant.currencysymbol + amount.toString(),
//           style: TextStyle(fontSize: 17.0),
//         ),
//       );
//     }
//   }

//   createPaymentToken() async {
//     setLoadingState(true);
//     final CreditCard testCard = CreditCard(
//       name: _card.name,
//       number: _paymentCard.number,
//       cvc: _paymentCard.cvv.toString(),
//       expMonth: _paymentCard.month,
//       expYear: _paymentCard.year,
//       /*cvc: '123',
//       expMonth: 12,
//       expYear: 21,*/
// //        country: 'US',
// //        addressCity: 'Kansas',
// //        addressState: 'Kansas',
// //        addressZip: '60007',
// //        addressLine1: 'adcsafsadf',
// //        addressLine2: 'dadada',
// //        addressCountry: 'US'
//     );

//     /* if (widget.payviachargecard) {
//       StripePayment.createTokenWithCard(
//         testCard,
//       ).then((token) {
//         setLoadingState(true);*/
//     //WebServices(context, this).callapiPaymentCharge(token.tokenId, constant.EMAIL, constant.AMOUNT, constant.CURRENCY);
//     createCharge();
//     //print("tokenId-" + token.tokenId);
//     /* }).catchError(setError);
//     }*/ /* else {
//       var dataresponse = await StripeService.payViaExistingCard(
//           amount: (amount * 100).toInt().toString(),
//           currency: Constant.currencyname.toLowerCase(),
//           card: testCard);

//       setLoadingState(false);

//       if (dataresponse.success) {
//         widget.callback(dataresponse.stripePayId);
//       }}*/
//     //  }
//   }

//   Future<Map<String, dynamic>> createCharge() async {
//     scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(StringsRes.transactionsuccess)));
//   }

//   void setError(dynamic error) {
//     if (this.showLoader)
//       setState(() {
//         this.showLoader = false;
//       });
//     Dialogs.showInfoDialog(context, error.toString(), onPressed: null);
//   }

//   @override
//   void onApiFailure(String statusCode, String message) {
//     //print("LOGIN SCREEN -> FAILURE : " + message);
//     setLoadingState(false);
//     Dialogs.showInfoDialog(context, message, onPressed: null);
//   }

//   @override
//   void onException() {
//     //print("LOGIN SCREEN -> NO EXCEPTION");
//     setLoadingState(false);
//   }

//   @override
//   void onNoInternetConnection() {
//     //print("LOGIN SCREEN -> NO INTERNET");
//     setLoadingState(false);
//     Dialogs.showInfoDialog(context, StringsRes.lblchecknetwork, onPressed: null);
//   }

//   @override
//   void setLoadingState(bool isShow) {
//     setState(() {
//       this.showLoader = isShow;
//     });
//   }
// }
