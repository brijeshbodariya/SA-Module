import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';
import 'package:smartkit/FullApp/CryptoTech/model/Transaction.dart';

final _scaffoldKeyoutgoing = GlobalKey<ScaffoldState>();

class BankingWalletTransactionActivity extends StatefulWidget {
  @override
  BankingState createState() => new BankingState();
}

class BankingState extends State<BankingWalletTransactionActivity> {
  List<Transaction> transactionlist;

  int notificationoffset = 0;
  ScrollController notificationcontroller;
  bool notificationisloadmore = true, notificationisgettingdata = true, notificationisnodata = false;
  var _searchEdit = new TextEditingController();
  String txnid = "";

  BankingState() {
    _searchEdit.addListener(() {
      if (_searchEdit.text.isEmpty) {
      } else {}
      /* setState(() {
        notificationisloadmore = true;
        notificationisgettingdata = true;
        notificationisnodata = false;
        transactionlist = new List<Transaction>();
        txnid = searchtext;
        notificationoffset = 0;
        LoadNotificationData();
      });*/
    });
  }

  @override
  void dispose() {
    notificationcontroller.dispose();
    //DesignConfig.SetStatusbarColor(ColorsRes.secondgradientcolor);
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    //DesignConfig.SetStatusbarColor(ColorsRes.firstgradientcolor);
    transactionlist = [];
    transactionlist = UIData.getBankTransactionList();
    notificationoffset = 0;

    notificationcontroller = ScrollController(keepScrollOffset: true);
    notificationcontroller.addListener(_transactionscrollListener);
    // LoadNotificationData();
  }

  _transactionscrollListener() {
    if (notificationcontroller.offset >= notificationcontroller.position.maxScrollExtent && !notificationcontroller.position.outOfRange) {
      setState(() {
        // LoadNotificationData();
      });
    }
  }

  Widget _searchBox() {
    return SizedBox(
      child: Card(
        elevation: 5,
        margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        shape: DesignConfig.roundedrectangleshape,
        color: ColorsRes.transfercolor.withOpacity(0.5),
        child: Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _searchEdit,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "${StringsRes.txtsearch}",
                  hintStyle: new TextStyle(color: ColorsRes.black),
                  icon: Icon(
                    Icons.search,
                    color: ColorsRes.black,
                  ),
                ),

                //textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKeyoutgoing,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: DesignConfig.gradient,
              ),
              padding: EdgeInsets.only(
                top: toppadding,
              ),
              child: Container(
                  decoration: BoxDecoration(
                    color: ColorsRes.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                  ),
                  child: NotificationContent())),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  StringsRes.bankingwallettransaction,
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
                ),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png')),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget NotificationContent() {
    return new NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {},
      child: Column(
        children: <Widget>[
          _searchBox(),
          SizedBox(
            height: 10,
          ),
          transactionlist.isEmpty || notificationisnodata
              ? Container()
              : Card(
                  color: ColorsRes.white,
                  shape: DesignConfig.SetRoundedBorder(ColorsRes.grey.withOpacity(0.5), 10),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: Text(
                              Constant.CURRENCYSYMBOL,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.secondgradientcolor, fontWeight: FontWeight.bold)),
                            ))),
                        VerticalDivider(
                          color: ColorsRes.grey,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: Text(
                              "Final ${Constant.CURRENCYSYMBOL}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.secondgradientcolor, fontWeight: FontWeight.bold)),
                            ))),
                        VerticalDivider(
                          color: ColorsRes.grey,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Expanded(
                            flex: 2,
                            child: Center(
                                child: Text(
                              "${StringsRes.type}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.secondgradientcolor, fontWeight: FontWeight.bold)),
                            ))),
                        VerticalDivider(
                          color: ColorsRes.grey,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Expanded(
                            flex: 3,
                            child: Center(
                                child: Text(
                              "${StringsRes.lbl_date}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.secondgradientcolor, fontWeight: FontWeight.bold)),
                            ))),
                        VerticalDivider(
                          color: ColorsRes.grey,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Expanded(
                            flex: 2,
                            child: Center(
                                child: Text(
                              "${StringsRes.staus}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.secondgradientcolor, fontWeight: FontWeight.bold)),
                            ))),
                      ]),
                    ),
                  ),
                ),
          Expanded(
            child: notificationisnodata
                ? Center(
                    child: Text(
                    StringsRes.no_data_found,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ))
                : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) => Divider(
                          color: ColorsRes.grey,
                        ),
                    padding: EdgeInsetsDirectional.only(start: 5, end: 5),
                    controller: notificationcontroller,
                    physics: ClampingScrollPhysics(),
                    itemCount: transactionlist.length,
                    itemBuilder: (context, index) {
                      Color typecolor = ColorsRes.transfercolor;
                      Color statuscolor = ColorsRes.green;

                      Transaction item;
                      try {
                        item = transactionlist.isEmpty ? null : transactionlist[index];
                        if (item.type.toLowerCase() == "topup") typecolor = ColorsRes.topupcolor;
                        if (item.status.toLowerCase() == "paid" || item.status.toLowerCase() == "pending")
                          statuscolor = ColorsRes.orange;
                        else if (item.status.toLowerCase() == "success")
                          statuscolor = ColorsRes.firstgradientcolor;
                        else
                          statuscolor = ColorsRes.red;
                      } on Exception catch (_) {}

                      return item == null
                          ? Container()
                          : Card(
                              color: ColorsRes.white,
                              shape: DesignConfig.roundedrectangleshape,
                              margin: EdgeInsets.only(bottom: 5),
                              child: IntrinsicHeight(
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                    Expanded(
                                        flex: 1,
                                        child: Text(
                                          item.amount,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: ColorsRes.black),
                                        )),
                                    VerticalDivider(
                                      color: ColorsRes.grey,
                                    ),
                                    Expanded(flex: 1, child: Text(item.final_amount, textAlign: TextAlign.center, style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.black)))),
                                    VerticalDivider(
                                      color: ColorsRes.grey,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "\t${Constant.setFirstLetterUppercase(item.type)}\t",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold, backgroundColor: typecolor)),
                                        )),
                                    VerticalDivider(
                                      color: ColorsRes.grey,
                                    ),
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                          item.created_on,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.black)),
                                        )),
                                    VerticalDivider(
                                      color: ColorsRes.grey,
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          Constant.setFirstLetterUppercase(item.status),
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context).textTheme.caption.merge(TextStyle(color: statuscolor, fontWeight: FontWeight.bold)),
                                        )),
                                  ]),
                                ),
                              ),
                            );
                    }),
          ),
        ],
      ),
    );
  }
}
