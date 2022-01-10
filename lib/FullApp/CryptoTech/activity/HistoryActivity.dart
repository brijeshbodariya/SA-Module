import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/HomePage.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/MainActivity.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/TradeDetail.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DecoratedTabBar.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/model/Transaction.dart';
import 'TransactionDetail.dart';

final _scaffoldKeyoutgoing = GlobalKey<ScaffoldState>();

class HistoryActivity extends StatefulWidget {
  int tabindex;

  HistoryActivity(this.tabindex);

  @override
  HistoryState createState() => new HistoryState(this.tabindex);
}

class HistoryState extends State<HistoryActivity> with TickerProviderStateMixin {
  TabController tabController;
  int tabindex;
  //HistoryState(this.tabindex);
  List<Transaction> transactionlist, tradelist;

  int transactionoffset = 0, tradeoffset = 0;
  ScrollController transactioncontroller, tradecontroller;
  bool transactionisloadmore = true, tradeisloadmore = true, transactionisgettingdata = true, tradeisgettingdata = true, transactionisnodata = false, tradeisnodata = false;

  String transactiontimefilter = Constant.Filter_all;
  String tradetimefilter = Constant.Filter_all;

  DateTime trafrom, trato;

  static String title = StringsRes.history;

  Widget appBarTitle = new Text(
    title,
    style: new TextStyle(color: Colors.black),
  );

  Icon iconsearch = new Icon(
    Icons.search,
    color: Colors.black,
  );
  final TextEditingController _controller = new TextEditingController();

  String _searchText = "", _lastsearch = "";
  final FocusNode filterFocus = FocusNode();
  bool _isSearching = false;

  HistoryState(this.tabindex) {
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }

      if (_lastsearch != _searchText) {
        _lastsearch = _searchText;

        if (tabController.index == 0) {
          ReloadTransactionData();
        } else {
          ReloadTradeData();
        }
      }
    });
  }

  /*@override
  void dispose() {
    tabController.dispose();
    transactioncontroller.dispose();
    tradecontroller.dispose();
    //DesignConfig.SetStatusbarColor(ColorsRes.secondgradientcolor);
    super.dispose();
  }*/

  @override
  void initState() {
    super.initState();
    //DesignConfig.SetStatusbarColor(ColorsRes.bgcolor);

    transactionlist = [];
    tradelist = [];

    transactionlist = maintransactionlist;
    tradelist = maintradelist;

    tabController = new TabController(length: 2, vsync: this, initialIndex: tabindex);

    _isSearching = false;
    transactionoffset = 0;
    tradeoffset = 0;

    //loadTransactionData();
    //loadTradeData();
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(
          color: ColorsRes.black,
        ),
        elevation: 0.0,
        /* flexibleSpace: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: DesignConfig.appbargradient),
        ),*/
        brightness: Brightness.light,
        backgroundColor: ColorsRes.bgcolor,
        centerTitle: true,
        title: appBarTitle,
        bottom: DecoratedTabBar(
          tabBar: TabBar(
            controller: tabController,
            labelStyle: TextStyle(
              color: ColorsRes.hometitlecolor,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
            unselectedLabelStyle: TextStyle(
              color: ColorsRes.grey,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
            unselectedLabelColor: ColorsRes.datecolor,
            labelColor: ColorsRes.firstgradientcolor,
            indicatorColor: ColorsRes.bgcolor,
            tabs: [
              Align(alignment: Alignment.centerRight, child: Tab(text: StringsRes.transactions)),
              Align(alignment: Alignment.centerLeft, child: Tab(text: StringsRes.trades)),
            ],
          ),
          bgcolor: ColorsRes.bgcolor,
          decoration: null,
          /* decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorsRes.grey,
                width: 0.3,
              ),
            ),
          ),*/
        ),
        actions: <Widget>[
          new IconButton(
            icon: iconsearch,
            onPressed: () {
              setState(() {
                if (this.iconsearch.icon == Icons.search) {
                  this.iconsearch = new Icon(
                    Icons.close,
                    color: Colors.black,
                  );
                  this.appBarTitle = new TextField(
                    autofocus: true,
                    controller: _controller,
                    style: new TextStyle(
                      color: Colors.black,
                    ),
                    decoration: new InputDecoration(prefixIcon: new Icon(Icons.search, color: Colors.black), hintText: "Search...", hintStyle: new TextStyle(color: Colors.black)),
                    // onChanged: searchOperation,
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.iconsearch = new Icon(
        Icons.search,
        color: Colors.black,
      );
      this.appBarTitle = new Text(
        title,
        style: new TextStyle(color: Colors.black),
      );
      _isSearching = false;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKeyoutgoing,
        backgroundColor: ColorsRes.white,
        appBar: buildAppBar(context),
        /* bottomNavigationBar:
            DesignConfig.SetBottomNavigation(2, context, false), */
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
          //color: ColorsRes.white,
          //shape: DesignConfig.roundedrectangleshape,
          //margin: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: TabBarView(
            controller: tabController,
            children: [
              TransactionContent(),
              TradeContent(),
            ],
          ),
        ),
      ),
    );
  }

  ReloadTransactionData() {
    transactionisloadmore = true;
    transactionoffset = 0;
    //loadTransactionData();
  }

  ReloadTradeData() {
    tradeisloadmore = true;
    tradeoffset = 0;
    //loadTradeData();
  }

  Widget TransactionContent() {
    return new NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {},
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Wrap(spacing: 10, children: [
              GestureDetector(
                  onTap: () {
                    if (transactiontimefilter != Constant.Filter_today) {
                      setState(() {
                        transactiontimefilter = Constant.Filter_today;
                      });
                      ReloadTransactionData();
                    }
                  },
                  child: Text(
                    StringsRes.filtertoday,
                    style: TextStyle(fontWeight: FontWeight.bold, color: transactiontimefilter == Constant.Filter_today ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                  )),
              GestureDetector(
                  onTap: () {
                    if (transactiontimefilter != Constant.Filter_week) {
                      setState(() {
                        transactiontimefilter = Constant.Filter_week;
                      });
                      ReloadTransactionData();
                    }
                  },
                  child: Text(
                    StringsRes.filterweek,
                    style: TextStyle(fontWeight: FontWeight.bold, color: transactiontimefilter == Constant.Filter_week ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                  )),
              GestureDetector(
                  onTap: () {
                    if (transactiontimefilter != Constant.Filter_month) {
                      setState(() {
                        transactiontimefilter = Constant.Filter_month;
                      });
                      ReloadTransactionData();
                    }
                  },
                  child: Text(
                    StringsRes.filtermonth,
                    style: TextStyle(fontWeight: FontWeight.bold, color: transactiontimefilter == Constant.Filter_month ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                  )),
              GestureDetector(
                  onTap: () {
                    if (transactiontimefilter != Constant.Filter_year) {
                      setState(() {
                        transactiontimefilter = Constant.Filter_year;
                      });
                      ReloadTransactionData();
                    }
                  },
                  child: Text(
                    StringsRes.filteryear,
                    style: TextStyle(fontWeight: FontWeight.bold, color: transactiontimefilter == Constant.Filter_year ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                  )),
              GestureDetector(
                  onTap: () {
                    if (transactiontimefilter != Constant.Filter_all) {
                      setState(() {
                        transactiontimefilter = Constant.Filter_all;
                      });
                      ReloadTransactionData();
                    }
                  },
                  child: Text(
                    StringsRes.filterall,
                    style: TextStyle(fontWeight: FontWeight.bold, color: transactiontimefilter == Constant.Filter_all ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                  )),
            ]),
            SizedBox(height: 10),
            ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) => Divider(
                      height: 25,
                      color: ColorsRes.bgcolor,
                    ),
                padding: EdgeInsetsDirectional.only(bottom: 5, start: 5, end: 5, top: 12),
                controller: transactioncontroller,
                physics: ClampingScrollPhysics(),
                itemCount: transactionlist.length,
                itemBuilder: (context, index) {
                  Transaction transaction = transactionlist[index];

                  return transaction == null
                      ? Container()
                      : GestureDetector(
                          child: Row(children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${Constant.SetStatuswithSplit(transaction.type).trim()}",
                                      style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.hometitlecolor, fontWeight: FontWeight.bold)),
                                    ),
                                    Text(Constant.setFirstLetterUppercase(transaction.status), style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: Constant.StatusColor(transaction.status)))),
                                  ],
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("${Constant.CURRENCYSYMBOL}${transaction.amount}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.w700)), textAlign: TextAlign.end),
                                Text(Constant.DisplayDateTimeyearText(transaction.created_on), style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.datecolor, fontWeight: FontWeight.w700)), textAlign: TextAlign.end),
                              ],
                            ),
                          ]),
                          onTap: () {
                            selectedtransaction = transaction;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionDetail("history")));
                          });
                }),
          ],
        ),
      ),
    );
  }

  Widget TradeContent() {
    return new NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Wrap(spacing: 10, children: [
            GestureDetector(
                onTap: () {
                  if (tradetimefilter != Constant.Filter_today) {
                    setState(() {
                      tradetimefilter = Constant.Filter_today;
                    });
                    ReloadTradeData();
                  }
                },
                child: Text(
                  StringsRes.filtertoday,
                  style: TextStyle(fontWeight: FontWeight.bold, color: tradetimefilter == Constant.Filter_today ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                )),
            GestureDetector(
                onTap: () {
                  if (tradetimefilter != Constant.Filter_week) {
                    setState(() {
                      tradetimefilter = Constant.Filter_week;
                    });
                    ReloadTradeData();
                  }
                },
                child: Text(
                  StringsRes.filterweek,
                  style: TextStyle(fontWeight: FontWeight.bold, color: tradetimefilter == Constant.Filter_week ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                )),
            GestureDetector(
                onTap: () {
                  if (tradetimefilter != Constant.Filter_month) {
                    setState(() {
                      tradetimefilter = Constant.Filter_month;
                    });
                    ReloadTradeData();
                  }
                },
                child: Text(
                  StringsRes.filtermonth,
                  style: TextStyle(fontWeight: FontWeight.bold, color: tradetimefilter == Constant.Filter_month ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                )),
            GestureDetector(
                onTap: () {
                  if (tradetimefilter != Constant.Filter_year) {
                    setState(() {
                      tradetimefilter = Constant.Filter_year;
                    });
                    ReloadTradeData();
                  }
                },
                child: Text(
                  StringsRes.filteryear,
                  style: TextStyle(fontWeight: FontWeight.bold, color: tradetimefilter == Constant.Filter_year ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                )),
            GestureDetector(
                onTap: () {
                  if (tradetimefilter != Constant.Filter_all) {
                    setState(() {
                      tradetimefilter = Constant.Filter_all;
                    });
                    ReloadTradeData();
                  }
                },
                child: Text(
                  StringsRes.filterall,
                  style: TextStyle(fontWeight: FontWeight.bold, color: tradetimefilter == Constant.Filter_all ? ColorsRes.firstgradientcolor : ColorsRes.grey.withOpacity(0.7)),
                )),
          ]),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                      height: 25,
                      color: ColorsRes.bgcolor,
                    ),
                padding: EdgeInsetsDirectional.only(bottom: 5, start: 5, end: 5, top: 12),
                controller: tradecontroller,
                physics: ClampingScrollPhysics(),
                itemCount: tradelist.length,
                itemBuilder: (context, index) {
                  Transaction transaction = tradelist[index];

                  return transaction == null
                      ? Container()
                      : GestureDetector(
                          child: Row(children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${Constant.setFirstLetterUppercase(transaction.crypto_currency_type)}",
                                      style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.hometitlecolor, fontWeight: FontWeight.bold)),
                                    ),
                                    Text(Constant.setFirstLetterUppercase(transaction.status), style: Theme.of(context).textTheme.caption.merge(TextStyle(fontWeight: FontWeight.bold, color: Constant.StatusColor(transaction.status)))),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "${Constant.USCURRENCYSYMBOL}${transaction.dollar_amount}",
                                style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.w700)),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("${Constant.CURRENCYSYMBOL}${transaction.naira_amount}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.w700)), textAlign: TextAlign.end),
                                  Text(
                                    Constant.DisplayDateTimeyearText(transaction.created_on),
                                    style: Theme.of(context).textTheme.caption.merge(
                                          TextStyle(color: ColorsRes.datecolor, fontWeight: FontWeight.w700),
                                        ),
                                    textAlign: TextAlign.end,
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          onTap: () {
                            selectedtrade = transaction;
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TradeDetail("history")));
                          });
                }),
          ),
        ],
      ),
    );
  }
}
