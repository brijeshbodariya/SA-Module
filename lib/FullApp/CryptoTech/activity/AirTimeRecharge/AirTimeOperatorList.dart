import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/AirTimeRecharge/RechargeAmountPage.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/model/Operator.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';

Operator selectedoperator;

class AirTimeOperatorList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AirTimeOperatorListState();
  }
}

class AirTimeOperatorListState extends State<AirTimeOperatorList> {
  TextEditingController edttitle = TextEditingController();
  TextEditingController edtmessage = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Operator> operatorlist;

  @override
  void initState() {
    super.initState();
    selectedoperator = null;
    operatorlist = [];
    operatorlist = UIData.getOperatorList();
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      bottomNavigationBar: selectedoperator == null
          ? null
          : GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RechargeAmountPage()));
              },
              child: DesignConfig.EnDisButton(StringsRes.next, ColorsRes.white, context)),
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
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Align(alignment: Alignment.centerRight, child: Text("${StringsRes.airtimepoints} : ${UIData.airtimepoints}\t\t", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)))),
      Text("\t\t${StringsRes.selectoperator}", style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.bold))),
      Expanded(
        child: GridView.count(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
          children: List.generate(operatorlist.length, (index) {
            Operator operator = operatorlist[index];
            return GestureDetector(
                onTap: () async {
                  setState(() {
                    selectedoperator = operator;
                  });
                },
                child: Card(
                  shape: DesignConfig.SetRoundedBorder(ColorsRes.white, 10),
                  color: selectedoperator == operator ? ColorsRes.firstgradientcolor : ColorsRes.lightgrey,
                  child: Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      FadeInImage(
                        image: NetworkImage(operator.logoUrls[2]),
                        fit: BoxFit.contain,
                        height: 80,
                        width: 80,
                        placeholder: CachedNetworkImageProvider(
                          "https://smartkit.wrteam.in/smartkit/cryptotech/placeholder.png",
                        ),
                      ),

                      // FadeInImage.assetNetwork(
                      //   placeholder: 'https://smartkit.wrteam.in/smartkit/cryptotech/placeholder.png',
                      //   image: operator.logoUrls[2],
                      //   fit: BoxFit.contain,
                      //   height: 80,
                      //   width: 80,
                      // ),
                      Text(
                        operator.name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: selectedoperator == operator ? ColorsRes.white : ColorsRes.black.withOpacity(0.7))),
                      ),
                    ]),
                  ),
                ));
          }),
        ),
      )
    ]);
  }
}
