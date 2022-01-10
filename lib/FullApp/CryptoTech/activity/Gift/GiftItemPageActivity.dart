import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/model/Gift.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/linear_percent_indicator.dart';
import 'GiftOrderListActivity.dart';

class GiftItemPageActivity extends StatefulWidget {
  @override
  GiftItemPageState createState() => new GiftItemPageState();
}

class GiftItemPageState extends State<GiftItemPageActivity> {
  bool isLoading = true, requestloading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Gift currentgift, nextgift;
  String mytradeamount = "0";
  String dmytradeamount = "0";

  TextEditingController edtname = new TextEditingController();
  TextEditingController edtemail = new TextEditingController();
  TextEditingController edtaddress = new TextEditingController();
  TextEditingController edtphone = new TextEditingController();

  double nxtper = 0;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    GetGiftData();
  }

  String giftdata = '''
  {
    
        "gift": {
            "id": "2",
            "title": "Computer Keyboard",
            "min_sell_trade_amount": "2000",
            "image": "https://smartkit.wrteam.in/smartkit/cryptotech/gift1.jpg",
            "status": "1",
            "created_on": "2021-01-25 13:28:00"
        },
        "user_sell_trade_amount": "49942.72000002861",
        "next_gift": {
            "id": "3",
            "title": "Watch",
            "min_sell_trade_amount": "100000",
            "image": "https://smartkit.wrteam.in/smartkit/cryptotech/gift2.jpg",
            "status": "1",
            "created_on": "2021-01-25 13:29:31"
        }
    
}
  ''';

  Future<void> GetGiftData() async {
    final res = json.decode(giftdata);

    mytradeamount = res['user_sell_trade_amount'].toString() ?? '0';
    dmytradeamount = double.parse(res['user_sell_trade_amount']).toStringAsFixed(2);
    currentgift = res['gift'] == null ? null : Gift.fromJson(res['gift']);
    nextgift = res['next_gift'] == null ? null : Gift.fromJson(res['next_gift']);

    if (nextgift != null) {
      nxtper = ((double.parse(mytradeamount) * 100) / double.parse(nextgift.min_sell_trade_amount)) / 100;
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      bottomNavigationBar: currentgift == null
          ? null
          : Container(
              color: ColorsRes.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  requestloading
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new CircularProgressIndicator(),
                        )
                      : Container(),
                  FlatButton(
                      minWidth: double.maxFinite,
                      child: Text(
                        StringsRes.confirmorder,
                        style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                      ),
                      textColor: ColorsRes.white,
                      color: ColorsRes.firstgradientcolor,
                      onPressed: () async {}),
                ],
              ),
            ),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: ColorsRes.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(18), topLeft: Radius.circular(18)),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: isLoading
                      ? Center(child: new CircularProgressIndicator())
                      : currentgift == null && nextgift == null
                          ? Center(
                              child: Text(
                              StringsRes.nofreegiftfound,
                              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(fontWeight: FontWeight.bold)),
                            ))
                          : ContentWidget(),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.freegift, style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png'),
                    )),
                actions: [
                  IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GiftOrderListActivity()));
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ContentWidget() {
    if (currentgift != null) {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Align(
                  alignment: Alignment.center,
                  heightFactor: 0.9,
                  widthFactor: 1,
                  child: CachedNetworkImage(
                    imageUrl: currentgift.image,
                    height: 250,
                    fit: BoxFit.fill,
                  )),
            )),
            Center(
                child: Text(
              currentgift.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            SizedBox(
              height: 15,
            ),
            Center(
                child: Text(
              "Your Total Sell Trade : $dmytradeamount",
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: ColorsRes.firstgradientcolor)),
            )),
            SizedBox(
              height: 15,
            ),
            Text("${StringsRes.username}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '${StringsRes.username}',
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                keyboardType: TextInputType.text,
                validator: (val) => val.trim().isEmpty ? "${StringsRes.enterusername}" : null,
                controller: edtname,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text("${StringsRes.email_address}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '${StringsRes.email_address}',
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (val) => Constant.validateEmail(val),
                controller: edtemail,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text("${StringsRes.phonenumber}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '${StringsRes.phonenumber}',
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                keyboardType: TextInputType.phone,
                validator: (val) => Constant.validateMobile(val),
                controller: edtphone,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text("${StringsRes.address}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.appcolor))),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: DesignConfig.outlineboxtext,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: TextFormField(
                style: TextStyle(color: ColorsRes.black, fontSize: 14),
                cursorColor: ColorsRes.appcolor,
                decoration: InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: '${StringsRes.address}',
                  hintStyle: TextStyle(color: ColorsRes.grey),
                ),
                textAlign: TextAlign.start,
                minLines: 5,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                validator: (val) => val.trim().isEmpty ? "${StringsRes.enteraddress}" : null,
                controller: edtaddress,
              ),
            ),
          ],
        ),
      );
    } else if (nextgift != null) {
      return Column(
        children: [
          Center(
              child: GestureDetector(
                  onTap: () {},
                  child: FadeInImage.assetNetwork(
                    placeholder: "https://smartkit.wrteam.in/smartkit/cryptotech/placeholder.png",
                    image: nextgift.image,
                    height: 250,
                  ))),
          Center(
              child: Text(
            nextgift.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 15,
          ),
          Center(
              child: Text(
            "Your Total Sell Trade : $dmytradeamount",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: ColorsRes.firstgradientcolor)),
          )),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: LinearPercentIndicator(
              animation: true,
              animationDuration: 1000,
              lineHeight: 15.0,
              percent: nxtper,
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: ColorsRes.firstgradientcolor,
              backgroundColor: ColorsRes.firstgradientcolor.withOpacity(0.3),
            ),
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.black)), text: "You Need to Complete\t", children: <TextSpan>[
                TextSpan(text: nextgift.min_sell_trade_amount, style: TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.bold)),
                TextSpan(text: "\tSell Trade Amount to get this exciting Gift. Click below button to start trading.", style: TextStyle(color: ColorsRes.black)),
              ])),
        ],
      );
    } else {
      return Container(
        height: 5,
      );
    }
  }
}
