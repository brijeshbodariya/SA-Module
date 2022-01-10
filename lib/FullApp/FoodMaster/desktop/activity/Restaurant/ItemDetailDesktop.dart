import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/CartPayment/CartListPageDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/MainHomePageDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/profile/FavouriteListDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ease_in_widget.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RestaurantDetailDesktop.dart';

class ItemDetailDesktop extends StatefulWidget {
  final bool isfavitem;
  const ItemDetailDesktop({
    Key key,
    this.isfavitem,
  }) : super(key: key);
  @override
  _ItemDetailStateDesktop createState() => _ItemDetailStateDesktop();

  /*@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //throw UnimplementedError();
  }*/
}

class _ItemDetailStateDesktop extends State<ItemDetailDesktop> {
  bool isfav = false;
  bool istouchfav = false;
  String favicon = "favourite_uncheked";
  ScrollController _hideButtonController;
  var _isVisible;
  double expandheight = 400;
  GlobalKey<ScaffoldState> scaffoldKey;
  int qty = 1;
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  int counter = 0;
  List<Extras> extrasforall = [
    Extras(id: 1, itemId: 1, price: "1.19", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1),
    Extras(id: 2, itemId: 2, price: "2.199", name: "Extra Ketchup", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1),
    Extras(id: 3, itemId: 3, price: "5.199", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)
  ];
  List<Extras> displayextraslist = [
    Extras(id: 1, itemId: 1, price: "1", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1),
    Extras(id: 2, itemId: 2, price: "2.19", name: "Extra Ketchup", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1),
    Extras(id: 3, itemId: 3, price: "5.19", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1),
    Extras(id: 4, itemId: 4, price: "3.19", name: "Extra Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1),
    Extras(id: 5, itemId: 5, price: "7.19", name: "Extra Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1),
    Extras(id: 6, itemId: 6, price: "6.1", name: "Extra salad", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)
  ];
  Extras extras;
  Map<int, Extras> selectedextras;
  int silverlength = 0;
  Map selectedoptions;
  double totalprice;
  double pricewithqty;
  Variants selectedvariantid;
  int currentoptionselectedindex = 0;
  bool displayqtyui = false;

  // Future<Null> getData() async {
  //   final SharedPreferences prefs = await _sprefs;
  //   int data = int.parse((prefs.getString('counter')));
  //   this.setState(() {
  //     counter = data;
  //   });
  // }

  Future<Null> incrementCounter() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      counter = counter + 1;
      prefs.setString('counter', counter.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    /*setState(() {
      // getData();
    });*/

    extrasforall;
    displayextraslist;
    selectedextras = new Map<int, Extras>();
    selectedoptions = {};

    isfav = widget.isfavitem;
    favicon = widget.isfavitem ? "favourite_icon" : "favourite_uncheked";

    _isVisible = false;
    _hideButtonController = new ScrollController();
    backbtnVisibility();
    setExtrasforAll();
  }

  backbtnVisibility() {
    _hideButtonController.addListener(() {
      if (_hideButtonController.offset > expandheight && !_hideButtonController.position.outOfRange) {
        if (!_isVisible) {
          _isVisible = true;
          setState(() {});
        }
      }
      if (_hideButtonController.offset <= expandheight && !_hideButtonController.position.outOfRange) {
        if (_isVisible) {
          _isVisible = false;
          setState(() {});
        }
      }
      print("visibility==$_isVisible");
      if (_hideButtonController.offset >= _hideButtonController.position.maxScrollExtent && !_hideButtonController.position.outOfRange) {
        print("reach the bottom");
        if (!_isVisible) {
          _isVisible = true;
          setState(() {});
        }
      }
    });
  }

  setExtrasforAll() {
    qty = 1;
    totalprice = selecteditem.price;
    pricewithqty = selecteditem.price;
    displayqtyui = false;
    extrasforall.clear();
    selectedextras.clear();
    displayextraslist.clear();
    selectedoptions.clear();
    selectedvariantid = null;
    currentoptionselectedindex = 0;

    if (selecteditem.hasVariants == 0) {
      extrasforall.addAll(selecteditem.extras);
      displayextraslist.addAll(selecteditem.extras);
      silverlength = 1;
      displayqtyui = true;
    } else {
      print("===ext--${selecteditem.extras.length}");
      for (Extras extras in selecteditem.extras) {
        if (extras.extraForAllVariants == 1) {
          extrasforall.add(extras);
        }
      }
      silverlength = 1;
    }

    print("len===${extrasforall.length}");
  }

  @override
  void dispose() {
    if (istouchfav) {
      if (favitemstreamdata != null && !favitemstreamdata.isClosed) favitemstreamdata.sink.add("");
      if (resdetailstreamdata != null && !resdetailstreamdata.isClosed) resdetailstreamdata.sink.add("");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      bottomNavigationBar: selecteditem.available == 0
          ? IntrinsicHeight(
              child: Center(
                  child: Text(
              StringsRes.itemnotavailable,
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.red, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
            )))
          : Opacity(
              opacity: displayqtyui ? 1 : 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      qtyWidget(),
                      Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: ButtonClickAnimation(
                          onTap: () {
                            //  counter++;
                            incrementCounter();
                            print(counter.toString());
                            setState(() {
                              addToCart();
                            });
                          },
                          child: CachedNetworkImage(
                            imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/addtocart_button.png",
                            height: MediaQuery.of(context).size.width / 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("  ${qty.toStringAsFixed(2)} x ${totalprice.toStringAsFixed(2)} = "),
                      Text(
                        "${Constant.currencysymbol}${pricewithqty.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.red, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            ),
      body: CustomScrollView(
        controller: _hideButtonController,
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: ColorsRes.bgcolor,
            brightness: Brightness.light,
            iconTheme: IconThemeData(
              color: ColorsRes.black,
            ),
            floating: false,
            pinned: true,
            automaticallyImplyLeading: _isVisible,
            actions: [if (_isVisible) favouriteWidget(), if (_isVisible) cartBtnWidget(true)],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _isVisible ? selecteditem.name : '',
                style: TextStyle(color: Colors.black),
              ),
              background: Visibility(
                visible: _isVisible ? false : true,
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Card(
                        shape: DesignConfig.setRoundedBorder(ColorsRes.appcolor, 15, false),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: EdgeInsets.all(20),
                        child: CachedNetworkImage(
                          imageUrl: selecteditem.logom,
                          fit: BoxFit.fill,
                          width: double.maxFinite,
                          height: 400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Card(
                          margin: EdgeInsets.only(left: 30, top: kToolbarHeight - MediaQuery.of(context).padding.top),
                          shape: DesignConfig.setRoundedBorder(ColorsRes.white, 10, false),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Icon(
                              Icons.keyboard_arrow_left,
                              color: ColorsRes.black,
                            ),
                          ),
                        ),
                      ),
                      /* Align(
                        alignment: Alignment.topRight,child: */
                      Padding(
                        padding: EdgeInsets.only(right: 30, top: kToolbarHeight - MediaQuery.of(context).padding.top),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [favouriteWidget(), SizedBox(width: 5), cartBtnWidget(false)],
                          ),
                        ),
                      ),
                      //),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundColor: ColorsRes.white,
                          radius: 58,
                          child: ClipOval(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: selecteditem.icon != null
                                  ? CachedNetworkImage(
                                      imageUrl: selecteditem.icon,
                                      fit: BoxFit.fill,
                                      height: 95,
                                      width: 95,
                                    )
                                  : CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/placeholder.png", height: 95, width: 95)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            expandedHeight: expandheight,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    itemInfoWidget(),
                    selecteditem.hasVariants == 0 && extrasforall.length != 0
                        ? extraWidget(1)
                        : selecteditem.variants.isNotEmpty
                            ? optionWidget()
                            : Container(),
                    if (selecteditem.hasVariants != 0 && currentoptionselectedindex == selecteditem.options.length && displayextraslist.isNotEmpty) extraWidget(2)
                  ],
                );
              },
              childCount: silverlength,
            ),
          ),
        ],
      ),
    );
  }

  cartBtnWidget(bool ispaddingtop) {
    return ButtonClickAnimation(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CartListPageDesktop(
                    id: counter,
                    id1: selecteditem.id.toString(),
                    id2: selectedrestaurant.id.toString(),
                    name: selecteditem.name,
                    price: totalprice,
                    logom: selecteditem.logom,
                    description: selecteditem.description,
                    extra: extras.name,
                    address: selectedrestaurant.address,
                    phone: selectedrestaurant.phone,
                    timeslot: selectedrestaurant.timeslotlist,
                    openTime: selectedrestaurant.openingTime,
                    closeTime: selectedrestaurant.closingTime,
                    mini: selectedrestaurant.minimum))).then((value) {
          setState(() {});
        });
      },
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: CachedNetworkImage(
            imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/cartbag_icon.png",
            width: MediaQuery.of(context).size.width / 40,
          ),
        ),
        new Align(
          alignment: Alignment.topRight,
          child: IntrinsicHeight(
            child: new Container(
              decoration: DesignConfig.boxDecorationContainer(ColorsRes.green, 5),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: ispaddingtop ? 8 : 0, left: 5),
              padding: EdgeInsets.only(
                left: 3,
                right: 3,
              ),
              child: new Text(
                counter.toString(),
                style: Theme.of(context).textTheme.caption.merge(TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        )
      ]),
    );
  }

  itemInfoWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: Column(children: [
        Row(children: [
          //  visible: _isVisible ? false : true,
          /* child:*/ Flexible(
            child: Text(
              selecteditem.name,
              overflow: TextOverflow.visible,
              style: Theme.of(context).textTheme.headline6.merge(TextStyle(
                    color: ColorsRes.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          )
        ]),
        SizedBox(height: 10),
        Row(children: [
          Text(
            Constant.currencysymbol,
            style: TextStyle(color: ColorsRes.IconColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "${selecteditem.price.toStringAsFixed(2)}",
            //"$totalprice",
            style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                  color: ColorsRes.black,
                )),
          ),
        ]),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              selecteditem.shortDescription,
              // textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.grey)),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              selecteditem.description,
              //  textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.grey)),
            ),
          ],
        ),
        Divider(
          color: ColorsRes.txtgreycolor,
          height: 15,
        ),
      ]),
    );
  }

  Widget qtyWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(width: 5),
      Text(
        StringsRes.lblqty,
        style: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold),
      ),
      ButtonClickAnimation(
        onTap: () {
          if (qty > 1) qty -= 1;

          pricewithqty = totalprice * qty;

          setState(() {});
        },
        child: Icon(
          Icons.remove_circle_outline,
          color: ColorsRes.IconColor,
          size: 35,
        ),
      ),
      SizedBox(width: 2),
      IntrinsicHeight(
        child: Container(
          width: 50,
          alignment: Alignment.center,
          child: Text(
            qty.toStringAsFixed(2),
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
          ),
        ),
      ),
      SizedBox(width: 2),
      ButtonClickAnimation(
        onTap: () {
          qty += 1;
          pricewithqty = totalprice * qty;
          setState(() {});
        },
        child: Icon(
          Icons.add_circle,
          color: ColorsRes.IconColor,
          size: 35,
        ),
      ),
    ]);
  }

  Widget optionWidget() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(selecteditem.options.length, (opindex) {
          Options options = selecteditem.options[opindex];
          List<String> optionlist = options.options.split(",");
          String selectedoptionval = selectedoptions[options.id.toString()] ?? '';

          return Visibility(
              visible: opindex <= currentoptionselectedindex,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(options.name,
                      style: Theme.of(context).textTheme.subtitle1.merge(
                            TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold),
                          )),
                ),
                Container(
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: List.generate(optionlist.length, (index) {
                        String strforcompare = optionlist[index].replaceAll(" ", "-").toLowerCase();

                        return EaseInWidget(
                            onTap: () {
                              currentoptionselectedindex = opindex + 1;
                              selectedoptions[options.id.toString()] = strforcompare;

                              if (displayextraslist.isNotEmpty) displayextraslist.clear();

                              totalprice = selecteditem.price;
                              selectedvariantid = null;
                              displayqtyui = false;

                              if (currentoptionselectedindex == selecteditem.options.length) {
                                String encodedstring = json.encode(selectedoptions);

                                for (Variants variants in selecteditem.variants) {
                                  if (variants.options == encodedstring) {
                                    displayextraslist.addAll(extrasforall);
                                    displayextraslist.addAll(variants.extras);
                                    selectedvariantid = variants;
                                    displayqtyui = true;

                                    break;
                                  }
                                }
                              } else if (currentoptionselectedindex != selecteditem.options.length) {
                                for (int i = currentoptionselectedindex; i < selecteditem.options.length; i++) {
                                  Options dummyoptions = selecteditem.options[i];

                                  if (selectedoptions.containsKey(dummyoptions.id.toString())) selectedoptions.remove(dummyoptions.id.toString());
                                }
                              }
                              setState(() {});
                            },
                            child: Card(
                              color: selectedoptionval == strforcompare ? ColorsRes.appcolor : ColorsRes.bgcolor,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                                child: Text(
                                  optionlist[index],
                                  style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: selectedoptionval == strforcompare ? ColorsRes.white : ColorsRes.black)),
                                ),
                              ),
                              shape: DesignConfig.setRoundedBorder(ColorsRes.lightgrey, 5, false),
                            ));
                      })),
                ),
              ]));
        }));
  }

  Widget extraWidget(int from) {
    print("from--$from");
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: displayextraslist.length,
      itemBuilder: (context, index) {
        extras = displayextraslist[index];
        return Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringsRes.lblextras,
                        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey, decoration: TextDecoration.underline)),
                      ),
                      Text(
                        "${Constant.currencysymbol}${totalprice.toStringAsFixed(2)}",
                        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.IconColor, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                      ),
                    ],
                  ),
                ),
              CheckboxListTile(
                activeColor: ColorsRes.IconColor,
                value: selectedextras[extras.id] == null ? false : true,
                onChanged: (checked) {
                  setState(
                    () {
                      if (checked) {
                        selectedextras[extras.id] = extras;
                        totalprice = totalprice + double.parse(extras.price);
                      } else {
                        selectedextras.remove(extras.id);
                        totalprice = totalprice - double.parse(extras.price);
                      }
                      totalprice = double.parse(totalprice.toStringAsFixed(2));
                      pricewithqty = totalprice * qty;
                    },
                  );
                },
                title: Text(
                  extras.name,
                  style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "+\t${Constant.currencysymbol}${extras.price}",
                  style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.green, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget favouriteWidget() {
    return EaseInWidget(
        child: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/$favicon.png",
          width: MediaQuery.of(context).size.width / 40,
        ),
        onTap: () async {
          bool newval = !isfav;
          istouchfav = true;
          favicon = newval ? "favourite_icon" : "favourite_uncheked";
          isfav = newval;
          //await Constant.db.insertdeleteItemBookmark(newval, selectedrestaurant.id.toString(), selecteditem.id.toString());
          setState(() {});
        });
  }

  addToCart() async {
    List<Map> submitdata = [];
    List<String> extrastring = [];
    List<String> extraids = [];
    selectedextras.forEach((key, value) {
      Map extras = {"id": key};
      submitdata.add(extras);
      Extras extrasname = value;
      extrastring.add(extrasname.name);
      extraids.add(key.toString());
    });

    //Map extramap = {"extrasSelected": submitdata};
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variantid'] = selectedvariantid == null ? '' : selectedvariantid.id.toString();
    data['qty'] = qty.toString();
    data['perprice'] = totalprice.toString();
    data['totalprice'] = pricewithqty.toStringAsFixed(2);
    data['extrasSelected'] = json.encode(submitdata);
    //data['extrasSelected'] = json.encode(extramap);

    String extradesc = "";
    if (selectedvariantid != null) {
      List<String> varstring = [];

      var res = selectedvariantid.options;
      for (Options options in selecteditem.options) {
        varstring.add(res[options.id]);
      }
      extradesc = varstring.join(',');
    }

    if (extrastring.isNotEmpty) {
      extradesc = extradesc + "+" + extrastring.join(",");
    }

    data['extradesc'] = extradesc;
    data['extraids'] = extraids.isEmpty ? '' : extraids.join(",");
    data['itemname'] = selecteditem.name;
    data['itemimage'] = selecteditem.icon;
    data['itemprice'] = selecteditem.price.toString();
    // await Constant.db.insertdeleteCartItem(true, data, selecteditem.id.toString(), selectedrestaurant.id.toString(), 0);
    scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(StringsRes.lblitemaddedtocart),
      backgroundColor: ColorsRes.green,
    ));
  }
}
