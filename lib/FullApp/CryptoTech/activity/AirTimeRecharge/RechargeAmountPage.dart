import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/AirTimeRecharge/AirTimeOperatorList.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';

class RechargeAmountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RechargeAmountPageState();
  }
}

class RechargeAmountPageState extends State<RechargeAmountPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = false;
  TextEditingController edtairtime = new TextEditingController();
  TextEditingController edtnaira = new TextEditingController();
  int selectedindex;
  double ONE_NAIRA_TO_AIRTIME_POINT = 50;

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      bottomNavigationBar: GestureDetector(onTap: () {}, child: DesignConfig.EnDisButton(StringsRes.lblsubmit, ColorsRes.white, context)),
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
                child: ContentWidget()),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.airtimerecharge, style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(padding: EdgeInsets.all(12.0), child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png'))),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ContentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Align(alignment: Alignment.centerRight, child: Text("${StringsRes.airtimepoints} : ${UIData.airtimepoints}\t\t", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)))),
              SizedBox(height: 10),
              Center(
                  child: FadeInImage.assetNetwork(
                placeholder: 'https://smartkit.wrteam.in/smartkit/cryptotech/placeholder.png',
                image: selectedoperator.logoUrls[2],
                fit: BoxFit.contain,
                height: 80,
                width: 80,
              )),
              Center(
                  child: Text(
                selectedoperator.name,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.button.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.black.withOpacity(0.7))),
              )),
              SizedBox(height: 10),
              selectedoperator.fixedAmounts.isEmpty ? Container() : Text("\t\t${StringsRes.selectrechargeamount}", style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.bold))),
              SizedBox(height: 10),
              Wrap(
                  children: List.generate(
                      selectedoperator.fixedAmounts.length,
                      (index) => GestureDetector(
                            onTap: () {
                              edtnaira.text = selectedoperator.fixedAmounts[index];
                              selectedindex = index;
                              SetAirTimePoint();
                              setState(() {});
                            },
                            child: Card(
                              shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
                              color: selectedindex == index ? ColorsRes.grey.withOpacity(0.5) : ColorsRes.white,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8, top: 5, bottom: 5),
                                child: Text("${selectedoperator.destinationCurrencySymbol}${selectedoperator.fixedAmounts[index]}"),
                              ),
                            ),
                          )))
            ]),
          ),
        ),
        SizedBox(height: 5),
        Text(
          "\t\t1 Airtime Point = ${Constant.CURRENCYSYMBOL}$ONE_NAIRA_TO_AIRTIME_POINT",
          style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 10),
        Text(
          "\t\t${StringsRes.airtimepoints}",
          style: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold),
        ),
        Card(
          shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
          margin: EdgeInsets.only(left: 10, right: 10),
          child: IntrinsicHeight(
            child: Row(children: <Widget>[
              Container(
                color: ColorsRes.lightgrey,
                width: 40,
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 5),
                child: Text("*",
                    style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                          color: ColorsRes.grey,
                          fontWeight: FontWeight.bold,
                        ))),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: ColorsRes.grey,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 5, end: 5),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: edtairtime,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "000000.00",
                      border: InputBorder.none,
                    ),
                    onChanged: (String enteredcoin) {
                      double maincoin = 000000.0;
                      if (enteredcoin != null && enteredcoin.length != 0) {
                        maincoin = double.parse(enteredcoin) * ONE_NAIRA_TO_AIRTIME_POINT;
                      }
                      edtnaira.text = maincoin.toString();
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "\t\t${StringsRes.nairaamount}",
          style: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold),
        ),
        Card(
          shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          child: IntrinsicHeight(
            child: Row(children: <Widget>[
              Container(
                color: ColorsRes.lightgrey,
                width: 40,
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 5),
                child: Text(Constant.CURRENCYSYMBOL,
                    style: Theme.of(context).textTheme.headline6.merge(TextStyle(
                          color: ColorsRes.grey,
                          fontWeight: FontWeight.bold,
                        ))),
              ),
              VerticalDivider(
                width: 1,
                thickness: 1,
                color: ColorsRes.grey,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(start: 5, end: 5),
                  child: TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    controller: edtnaira,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: "000000.00",
                      border: InputBorder.none,
                    ),
                    onChanged: (String enteredcoin) {
                      SetAirTimePoint();
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
        isLoading
            ? Center(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: new CircularProgressIndicator(),
              ))
            : Container(),
      ],
    );
  }

  void SetAirTimePoint() {
    double maincoin = 000000.0;
    if (edtnaira.text != null && edtnaira.text.toString().trim().length != 0) {
      maincoin = double.parse(edtnaira.text) / ONE_NAIRA_TO_AIRTIME_POINT;
    }
    edtairtime.text = maincoin.toString();
  }
}
