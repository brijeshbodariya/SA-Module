import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:smartkit/FullApp/FoodMaster/activity/CartPayment/CartListPage.dart';
import 'package:smartkit/FullApp/FoodMaster/activity/CartPayment/PaymentAddressPage.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/StripeChargeCardMethod.dart';

import 'Order_Place.dart';

class PaymentPage extends StatefulWidget {
  final List timeslot;

  const PaymentPage({Key key, this.timeslot}) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  RoundedRectangleBorder cardshape;
  TextStyle headerstyle;
  EdgeInsets cardmargin = EdgeInsets.only(bottom: 10);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String paymentmethod; // = StringsRes.cod;
  bool loadingorder = false;
  double finaltotal = totalcartprice;
  String deliverymethod = checkoutdata["delivery_method"];

  @override
  void initState() {
    super.initState();
    if (deliverymethod == StringsRes.delivery.toLowerCase()) {
      finaltotal = totalcartprice + deliverycost;
    }
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
          child: Container(
            padding: EdgeInsets.only(top: 13, bottom: 13),
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            alignment: Alignment.center,
            decoration: DesignConfig.buttonShadow(ColorsRes.appcolor, 30, ColorsRes.appcolor),
            child: Text(
              StringsRes.placeorder.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
      //  : null,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          summaryWidget(),
          paymentTypeWidget(),
          stripeWidget(),
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
    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => Order_Place()));
    setState(() {
      loadingorder = false;
    });
  }
}
