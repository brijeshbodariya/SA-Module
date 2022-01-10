import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/MainActivity.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';

final _scaffoldKey = GlobalKey<ScaffoldState>();

class QRDetailActivity extends StatefulWidget {
  String paymenttype, txnid, image = "", from = "";
  int pos;

  @override
  State<StatefulWidget> createState() {
    return QRDetailState();
  }
}

class QRDetailState extends State<QRDetailActivity> {
  String paymenttype, txnid, image = "", from = "", currentprice = "";
  int pos, leftmillisecond = 0;
  Color statuscolor = ColorsRes.black;
  String title = "", txtstatus = "", timeouttext = "", imgbarcode = "", amount = "", address = "", remainingtime = "";
  bool islytcomplete = false, islytmain = false;
  Timer timer, clocktimer;
  String cointtype;

  @override
  void initState() {
    super.initState();
    cointtype = selectedtrade.crypto_currency_type.trim();
    address = selectedtrade.to_wallet_address;
    image = selectedtrade.qr_code;
    SetCurrentRate();
    //GetCoinInfo();
  }

  void SetCurrentRate() {
    /* if(cointtype.toLowerCase() == Constant.btc.toLowerCase()){
      currentprice = Constant.session.getData(UserSessionManager.BTC_SELL_USD);
    }else if(cointtype.toLowerCase() == Constant.eth.toLowerCase()){
      currentprice = Constant.session.getData(UserSessionManager.ETH_SELL_USD);
    }else if(cointtype.toLowerCase() == Constant.ltct.toLowerCase()){
      currentprice = Constant.session.getData(UserSessionManager.LTCT_SELL_USD);
    }else if(cointtype.toLowerCase() == Constant.ltc.toLowerCase()){
      currentprice = Constant.session.getData(UserSessionManager.LTC_SELL_USD);
    }else if(cointtype.toLowerCase() == Constant.usdt.toLowerCase()){
      currentprice = Constant.session.getData(UserSessionManager.USDT_SELL_USD);
    }*/

    currentprice = "10";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: ColorsRes.homebgcolor,
        appBar: DesignConfig.SetAppbar(StringsRes.tradeaddress),
        body: Builder(
            builder: (context) => Center(
                    child: SingleChildScrollView(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5),
                  child: CoinPaymentView(),
                ))));
  }

  Widget CoinPaymentView() {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Text(
        "Current $cointtype Rate is ${Constant.CURRENCYSYMBOL}$currentprice per Dollar!",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.appcolor)),
      ),
      Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "${selectedtrade.crypto_amount} $cointtype",
            style: TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.black, fontSize: 15),
          )),
      Text(
        StringsRes.qrdetailinfo,
        style: Theme.of(context).textTheme.caption,
      ),
      Container(
        margin: EdgeInsets.only(bottom: 5, top: 10),
        decoration: DesignConfig.outlineboxtext,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 12, bottom: 12),
        child: Text(address, textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.secondgradientcolor, fontWeight: FontWeight.bold))),
      ),
      GestureDetector(
        onTap: () {
          Clipboard.setData(new ClipboardData(text: address));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Address copied')));
        },
        child: Padding(
            padding: EdgeInsets.only(top: 2, bottom: 15),
            child: Text(
              "Copy Address",
              style: TextStyle(color: ColorsRes.appcolor, decoration: TextDecoration.underline),
            )),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          StringsRes.qrscaninfo,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.appcolor),
        ),
      ),
      FadeInImage(
        image: NetworkImage(image),
        placeholder: CachedNetworkImageProvider(
          "https://smartkit.wrteam.in/smartkit/cryptotech/placeholder.png",
        ),
      ),
    ]);
  }
}
