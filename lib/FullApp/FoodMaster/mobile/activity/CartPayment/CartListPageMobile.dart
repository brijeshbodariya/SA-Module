import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/new_dialog.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/CartPayment/PaymentAddressPageMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Cart.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

Map checkoutdata;
double totalcartprice = 0;
List<String> cartitems;

class CartListPageMobile extends StatefulWidget {
  final String name, logom, description, extra, id1, id2, address, phone, openTime, closeTime, mini;
  final List timeslot;
  final int id;
  final double price;
  CartListPageMobile(
      /*final String name, double price, String logom, String description,*/ {Key key,
      this.id,
      this.name,
      this.price,
      this.logom,
      this.description,
      this.extra,
      this.id1,
      this.id2,
      this.address,
      this.phone,
      this.timeslot,
      this.openTime,
      this.closeTime,
      this.mini})
      : super(key: key);
  @override
  _CartListPageStateMobile createState() => _CartListPageStateMobile();
}

class _CartListPageStateMobile extends State<CartListPageMobile> {
  GlobalKey<ScaffoldState> scaffoldKey;
  List<Cart> cartlist;
  bool gettingdata = true;
  bool isnodata = false;
  final _focusStreamSubject = PublishSubject<double>();
  int a;
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  // Future<Null> getData() async {
  //   final SharedPreferences prefs = await _sprefs;
  //   int data = int.parse((prefs.getString('counter')));
  //   this.setState(() {
  //     a = data;
  //   });
  // }

  Future<Null> DecrementCounter() async {
    final SharedPreferences prefs = await _sprefs;
    setState(() {
      a = a - 1;
      prefs.setString('counter', a.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    checkoutdata = {};
    // getData();
    a = widget.id;
    cartlist = [
      Cart(
          id: 1,
          extrasprice: 1.1999,
          restaurantid: "1",
          userid: "",
          itemid: "1",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "10",
          variantid: "",
          extrasSelected: "2",
          perprice: "50.3" /*widget.price.toString()*/,
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 1, itemId: 1, price: "1.1999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 1,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 1, itemId: 1, price: "1.1999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 2,
          extrasprice: 2.1999,
          restaurantid: "2",
          userid: "",
          itemid: "2",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "20",
          variantid: "",
          extrasSelected: "2",
          perprice: "6.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 2, itemId: 2, price: "2.1999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 2,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 2, itemId: 2, price: "2.1999999999999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 3,
          extrasprice: 3.1999,
          restaurantid: "3",
          userid: "",
          itemid: "3",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "11",
          variantid: "",
          extrasSelected: "2",
          perprice: "7.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 3, itemId: 3, price: "3.199999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 3,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 3, itemId: 3, price: "3.199", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 4,
          extrasprice: 4.1999,
          restaurantid: "4",
          userid: "",
          itemid: "4",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "12",
          variantid: "",
          extrasSelected: "2",
          perprice: "20.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 4, itemId: 4, price: "4.199999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 4,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 4, itemId: 4, price: "4.19", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 5,
          extrasprice: 5.1999,
          restaurantid: "5",
          userid: "",
          itemid: "5",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "13",
          variantid: "",
          extrasSelected: "2",
          perprice: "6.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 5, itemId: 5, price: "5.1999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 5,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 5, itemId: 5, price: "5.1999999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 6,
          extrasprice: 6.1999,
          restaurantid: "6",
          userid: "",
          itemid: "6",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "14",
          variantid: "",
          extrasSelected: "2",
          perprice: "8.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 6, itemId: 6, price: "6.19999999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 6,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 6, itemId: 6, price: "6.19", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 7,
          extrasprice: 7.1999,
          restaurantid: "7",
          userid: "",
          itemid: "7",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "15",
          variantid: "",
          extrasSelected: "2",
          perprice: "7.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 7, itemId: 7, price: "7.199", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 7,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 7, itemId: 7, price: "7.199999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 8,
          extrasprice: 8.1999,
          restaurantid: "8",
          userid: "",
          itemid: "8",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "16",
          variantid: "",
          extrasSelected: "2",
          perprice: "9.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 8, itemId: 8, price: "8.199", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 8,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 8, itemId: 8, price: "8.19", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 9,
          extrasprice: 9.1999,
          restaurantid: "9",
          userid: "",
          itemid: "9",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "17",
          variantid: "",
          extrasSelected: "2",
          perprice: "30.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 9, itemId: 9, price: "9.199", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 9,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 9, itemId: 9, price: "9.1999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
      Cart(
          id: 10,
          extrasprice: 10.1999,
          restaurantid: "10",
          userid: "",
          itemid: "10",
          useritemid: "_1_1",
          userresid: "_1",
          qty: "18",
          variantid: "",
          extrasSelected: "2",
          perprice: "40.3",
          totalprice: widget.price.toString(),
          extradesc: widget.extra,
          extraids: "2",
          itemname: widget.name,
          itemimage: widget.logom,
          itemprice: widget.price.toString(),
          extraslist: [Extras(id: 10, itemId: 10, price: "10.19999", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)],
          item: Item(
              id: 10,
              name: widget.name,
              description: "chicken on a plate,totilla cake",
              image: widget.logom,
              price: widget.price,
              categoryId: 1,
              createdAt: "2021-02-18T10:09:05.000000Z",
              updatedAt: "2021-03-04T08:02:48.000000Z",
              available: 1,
              hasVariants: 0,
              vat: 21,
              deletedAt: null,
              logom: widget.logom,
              icon: widget.logom,
              shortDescription: "peeled tomatoes, mozzarella salad,...",
              variants: [],
              categoryName: "Salads",
              extras: [Extras(id: 10, itemId: 10, price: "10.1", name: widget.extra, createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)])),
    ];
    // print(widget.id.toString()+widget.logom+widget.price.toString()+widget.name+widget.description+widget.id1+widget.id2);
    // getCartItems();
  }

  cartItemCalculation(Cart cart, Item itemdata) async {
    cart.item = itemdata;

    List<Map> submitdata = [];
    List<String> extrastring = [];
    List<String> extraids = [];
    List<Extras> cartextraslist = [];

    double extrasprice = 0;
    List<String> cartextraids = cart.extraids.split(",");

    for (Extras extrasval in itemdata.extras) {
      if (cartextraids.contains(extrasval.id.toString())) {
        Map extras = {"id": extrasval.id};
        submitdata.add(extras);
        extrastring.add(extrasval.name);
        extraids.add(extrasval.id.toString());
        extrasprice = extrasprice + double.parse(extrasval.price);
        cartextraslist.add(extrasval);
      }
    }

    double totalprice = itemdata.price;
    if (extrasprice != 0) {
      totalprice = totalprice + extrasprice;
    }

    double pricewithqty = totalprice * int.parse(cart.qty);

    // Map extramap = {"extrasSelected": submitdata};
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['variantid'] = cart.variantid;
    data['qty'] = cart.qty;
    data['perprice'] = totalprice.toString();
    data['totalprice'] = pricewithqty.toStringAsFixed(2);
    data['extrasSelected'] = json.encode(submitdata);
    //data['extrasSelected'] = json.encode(extramap);

    String extradesc = "";
    if (cart.variantid.trim().isNotEmpty) {
      List<Variants> variantlist = [];
      variantlist.addAll(itemdata.variants.where((element) => element.id.toString() == cart.variantid).toList());

      Variants selectedvariantid;
      if (variantlist.isNotEmpty) {
        selectedvariantid = variantlist[0];
        List<String> varstring = [];

        var res = json.decode(selectedvariantid.options);
        for (Options options in itemdata.options) {
          varstring.add(res[options.id.toString()]);
        }
        extradesc = varstring.join(',');
      }
    }

    if (extrastring.isNotEmpty) {
      extradesc = extradesc + "+" + extrastring.join(",");
    }

    data['extradesc'] = extradesc;
    data['extraids'] = extraids.isEmpty ? '' : extraids.join(",");
    data['itemname'] = itemdata.name;
    data['itemimage'] = itemdata.icon;
    data['itemprice'] = itemdata.price.toString();

    cart.extrasprice = extrasprice;
    cart.extraslist = cartextraslist;
    cart.perprice = totalprice.toString();
    cart.totalprice = pricewithqty.toStringAsFixed(2);
    cart.itemname = itemdata.name;
    cart.itemimage = itemdata.icon;
    cart.itemprice = itemdata.price.toString();
    cart.extradesc = extradesc;
    cart.extrasSelected = json.encode(submitdata);
    cart.extraids = extraids.isEmpty ? '' : extraids.join(",");

    if (gettingdata) gettingdata = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorsRes.bgcolor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          StringsRes.lblcart,
          style: TextStyle(color: ColorsRes.black),
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorsRes.black,
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(children: [
            SizedBox(width: 8),
            Expanded(
                child: Text(
              StringsRes.lbltotal,
              style: Theme.of(context).textTheme.headline6,
            )),
            Text(
              "(${widget.id} ${StringsRes.lblitems})",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(width: 8),
            StreamBuilder(
              stream: _focusStreamSubject.stream,
              builder: ((context, AsyncSnapshot<double> snapshot) {
                return Text(
                  "${Constant.currencysymbol} ${snapshot.data}",
                  style: Theme.of(context).textTheme.headline6,
                );
                //return Container();
              }),
            ),
            SizedBox(width: 8),
          ]),
          ButtonClickAnimation(
            onTap: () {
              checkoutProcess();
            },
            child: Container(
              padding: EdgeInsets.only(top: 13, bottom: 13),
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              alignment: Alignment.center,
              decoration: DesignConfig.buttonShadow(ColorsRes.appcolor, 30, ColorsRes.appcolor),
              child: Text(
                StringsRes.lblcheckout.toUpperCase(),
                style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                      color: ColorsRes.white,
                    )),
              ),
            ),
          )
        ],
      ),
      body: cartlistWidget(),
    );
  }

  Widget cartlistWidget() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        separatorBuilder: (context, index) => SizedBox(height: 25),
        itemCount: a,
        itemBuilder: (context, index) {
          Cart cart = cartlist[index];
          if (index == 0) totalcartprice = 0;
          totalcartprice = double.parse((totalcartprice + double.parse(cart.totalprice)).toStringAsFixed(2));
          if (index == a - 1) {
            _focusStreamSubject.add(totalcartprice);
          }
          return ButtonClickAnimation(
              onTap: () {
                itemInfoDialogue(cart);
              },
              child: Row(children: [
                Card(
                  margin: EdgeInsets.all(0),
                  shape: DesignConfig.setRoundedBorder(Colors.white, 15, false),
                  elevation: 0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: CachedNetworkImage(
                    imageUrl: cart.item.logom /*widget.logom*/,
                    height: 75,
                    width: 80,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(children: [
                    Expanded(
                        child: Text(
                      cart.item.name,
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                    )),
                    ButtonClickAnimation(
                      onTap: () {
                        deleteItem(true, index, cart.itemid, cart.restaurantid, cart.id);
                        DecrementCounter();
                      },
                      child: Icon(
                        Icons.close,
                        color: ColorsRes.IconColor,
                        size: 18,
                      ),
                    ),
                  ]),
                  Text(cart.extradesc,
                      style: Theme.of(context).textTheme.caption.merge(TextStyle(
                            color: ColorsRes.grey,
                          ))),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Expanded(
                        child: RichText(
                            text: TextSpan(style: new TextStyle(color: ColorsRes.IconColor, fontWeight: FontWeight.bold), text: Constant.currencysymbol, children: <TextSpan>[
                      TextSpan(
                        text: double.parse(cart.totalprice).toStringAsFixed(2) /*widget.price.toString()*/,
                        style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.normal)),
                      ),
                    ]))),
                    qtyWidget(cart, index),
                  ]),
                ])),
              ]));
        });
  }

  Widget qtyWidget(Cart cart, int index) {
    int qty = int.parse(cart.qty);
    double perprice = double.parse(cart.perprice);
    double pricewithqty;

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      SizedBox(width: 5),
      ButtonClickAnimation(
        onTap: () {
          if (qty > 1) {
            qty -= 1;
            pricewithqty = perprice * qty;
            cart.totalprice = pricewithqty.toString();
            cart.qty = qty.toString();

            updateListItem(index, cart);
          }
        },
        child: Icon(
          Icons.remove_circle_outline,
          color: ColorsRes.IconColor,
        ),
      ),
      SizedBox(width: 5),
      IntrinsicHeight(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            qty.toString(),
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
          ),
        ),
      ),
      SizedBox(width: 5),
      ButtonClickAnimation(
        onTap: () {
          qty += 1;
          pricewithqty = perprice * qty;
          cart.totalprice = pricewithqty.toString();
          cart.qty = qty.toString();
          updateListItem(index, cart);
        },
        child: Icon(
          Icons.add_circle,
          color: ColorsRes.IconColor,
        ),
      ),
    ]);
  }

  updateListItem(int index, Cart cart) {
    cartlist[index] = cart;
    setState(() {});
  }

  deleteItem(bool isfromlist, int index, String itemid, String restaurantid, int cartid) async {
    if (isfromlist) {
      cartlist.removeAt(index);
      if (cartlist.isEmpty) isnodata = true;
      setState(() {});
    }
  }

  void itemInfoDialogue(Cart cart) {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //title: Text(),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: ColorsRes.white,
                  radius: 58,
                  child: ClipOval(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: cart.item.icon != null
                          ? CachedNetworkImage(
                              imageUrl: cart.item.logom /*widget.logom*/,
                              fit: BoxFit.fill,
                              height: 95,
                              width: 95,
                            )
                          : CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/placeholder.png", height: 95, width: 95)),
                ),
                Text(cart.item.name, style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold))),
                Text("${Constant.currencysymbol}${cart.item.price.toStringAsFixed(2)}", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.IconColor, fontWeight: FontWeight.bold))),
                if (cart.extraslist.isNotEmpty) Align(alignment: Alignment.centerLeft, child: Text(StringsRes.lblextras, style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)))),
                if (cart.extraslist.isNotEmpty)
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                        cart.extraslist.length,
                        (index) => Row(children: [
                              Expanded(
                                child: Text(
                                  cart.extraslist[index].name,
                                  style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
                                ),
                              ),
                              Text("${Constant.currencysymbol}${double.parse(cart.extraslist[index].price).toStringAsFixed(2)}", style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                            ])),
                  ),
                SizedBox(height: 8),
                Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
                  if (cart.extraslist.isNotEmpty) Divider(),
                  if (cart.extraslist.isNotEmpty) Text("${Constant.currencysymbol}${cart.extrasprice.toStringAsFixed(2)}", style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                  if (cart.extraslist.isNotEmpty) Text("${Constant.currencysymbol}${cart.item.price.toStringAsFixed(2)}", style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                  if (cart.extraslist.isNotEmpty) Divider(),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Text(cart.qty.toString(), style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                    Text("\tx\t", style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                    Text("${Constant.currencysymbol}${double.parse(cart.perprice).toStringAsFixed(2)}\t=\t", style: TextStyle(color: ColorsRes.black, fontFamily: 'Roboto', fontWeight: FontWeight.bold)),
                    Text("${Constant.currencysymbol}${double.parse(cart.totalprice).toStringAsFixed(2)}", style: TextStyle(color: ColorsRes.green, fontWeight: FontWeight.bold)),
                  ]),
                ]),
              ],
            ),
          ),
        );
      },
    );
  }

  void checkoutProcess() {
    checkoutdata = {};
    List<Map> items = [];
    cartitems = [];

    int resid = 0;
    for (Cart cart in cartlist) {
      Map item = {
        "id": cart.itemid,
        "qty": cart.qty,
        "extrasSelected": cart.extrasSelected, //json.decode(cart.extrasSelected),
        "variant": cart.variantid.trim().isEmpty ? "" : cart.variantid,
      };
      items.add(item);

      cartitems.add("${cart.qty}\tx\t${cart.itemname}");

      if (resid == 0) resid = int.parse(cart.restaurantid);
    }
    checkoutdata["vendor_id"] = resid;
    checkoutdata["items"] = items;
    // print("address is"+ selectedrestaurant.address);
    Navigator.of(context).push(CupertinoPageRoute(
        builder: (context) => PaymentAddressPageMobile(address: widget.address, name: widget.name, phone: widget.phone, timeslot: widget.timeslot, openTime: widget.openTime, closTome: widget.closeTime, mini: widget.mini, id: widget.id2)));
  }
}
