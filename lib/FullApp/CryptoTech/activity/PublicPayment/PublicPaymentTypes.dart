import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';

import 'UsernameForPayment.dart';

class PublicPaymentTypes extends StatefulWidget {
  String username;

  PublicPaymentTypes(this.username);

  @override
  State<StatefulWidget> createState() {
    return new PublicPaymentTypesState();
  }
}

class PublicPaymentTypesState extends State<PublicPaymentTypes> {
  List<Widget> paymenttypewidgetlist = [];
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    paymenttypewidgetlist = [];
    Createpaymenttypewidgetlist();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
              decoration: BoxDecoration(
                color: ColorsRes.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(18), topLeft: Radius.circular(18)),
              ),
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                          child: GridView.count(
                              // primary: false,
                              padding: EdgeInsets.only(left: 20, right: 20),
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 12,
                              crossAxisCount: 2,
                              childAspectRatio: 0.8,
                              children: paymenttypewidgetlist)),
                      isbank
                          ? Padding(
                              padding: EdgeInsets.only(left: 10, right: 5),
                              child: Row(children: [
                                CircleAvatar(
                                    backgroundColor: ColorsRes.grey.withOpacity(0.5),
                                    child: CachedNetworkImage(
                                      imageUrl: "https://smartkit.wrteam.in/smartkit/cryptotech/bank.png",
                                      height: 30,
                                      width: 30,
                                    )),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                                    Row(children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${StringsRes.lblbank}",
                                            style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold)),
                                          )),
                                      Text(":\t"),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "SBI",
                                            style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold)),
                                          )),
                                    ]),
                                    Row(children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${StringsRes.accountname}",
                                            style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold)),
                                          )),
                                      Text(":\t"),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            UIData.username,
                                            style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold)),
                                          )),
                                    ]),
                                    Row(children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            "${StringsRes.accountno}",
                                            style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold)),
                                          )),
                                      Text(":\t"),
                                      Expanded(
                                          flex: 3,
                                          child: Text(
                                            "123456789",
                                            style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold)),
                                          )),
                                    ]),
                                  ]),
                                )
                              ]))
                          : Container(),
                    ],
                  ),
                  isLoading
                      ? Positioned.fill(
                          child: Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            child: new CircularProgressIndicator(),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.publicpayment, style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png'),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  AddWidgetData(String type, String name, String image, Color imgcolor, bool isloader, double height) {
    TextEditingController edtusd = new TextEditingController();

    isloader = true;
    paymenttypewidgetlist.add(Container(
      decoration: DesignConfig.BoxDecorationContainer(ColorsRes.lightgrey, 8),
      padding: EdgeInsets.only(left: 14, right: 10, top: 5, bottom: 5),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        CachedNetworkImage(
          imageUrl: image,
          color: imgcolor,
          height: height,
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(color: ColorsRes.black.withOpacity(0.5), fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: edtusd,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(5),
            hintText: '${StringsRes.usd}',
            hintStyle: TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5)),
            border: new OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        FlatButton(
          onPressed: () {},
          child: Text(StringsRes.paynow),
          color: ColorsRes.firstgradientcolor,
          textColor: ColorsRes.white,
          shape: DesignConfig.SetRoundedBorder(ColorsRes.white, 8),
        )
      ]),
    ));
  }

  Createpaymenttypewidgetlist() {
    paymenttypewidgetlist = [];
    if (ispm) {
      AddWidgetData(Constant.pm, StringsRes.perfectmoney, 'https://smartkit.wrteam.in/smartkit/cryptotech/pm.png', ColorsRes.cardyellow, false, 36);
    }

    if (ispaxbit) {
      AddWidgetData(Constant.paxfulbitcoin, StringsRes.paxfulbitcoin, 'https://smartkit.wrteam.in/smartkit/cryptotech/paxful.png', ColorsRes.cardpurple, false, 36);
    }

    if (isbtc) {
      AddWidgetData(Constant.btc, StringsRes.btc, 'https://smartkit.wrteam.in/smartkit/cryptotech/btc.png', ColorsRes.cardblue, false, 36);
    }

    if (iseth) {
      AddWidgetData(Constant.eth, StringsRes.eth, 'https://smartkit.wrteam.in/smartkit/cryptotech/eth.png', ColorsRes.cardgreen, false, 36);
    }

    if (isltct) {
      AddWidgetData(Constant.ltct, StringsRes.ltct, 'https://smartkit.wrteam.in/smartkit/cryptotech/dollersymbol.png', ColorsRes.cardbrown, false, 36);
    }

    if (isltc) {
      AddWidgetData(Constant.ltc, StringsRes.ltc, 'https://smartkit.wrteam.in/smartkit/cryptotech/ltc.png', ColorsRes.cardpich, false, 36);
    }

    if (isusdt) {
      AddWidgetData(Constant.usdt, StringsRes.usdt, 'https://smartkit.wrteam.in/smartkit/cryptotech/usdt.png', ColorsRes.cardpink, false, 36);
    }
  }
}
