import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/ease_in_widget.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/activity/home/HomeScreenPageTablet.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Restaurant.dart';
import '../Restaurant/ItemDetailTablet.dart';
import '../MainHomePageTablet.dart';
import '../Restaurant/RestaurantDetailTablet.dart';

StreamController<String> favstreamdata;
StreamController<String> favitemstreamdata;

class FavouriteListTablet extends StatefulWidget {
  @override
  _FavouriteListStateTablet createState() => _FavouriteListStateTablet();
}

class _FavouriteListStateTablet extends State<FavouriteListTablet> {
  bool isgettingdata = true;
  bool isgettingitemdata = true;
  List<Restaurant> restaurantlist;
  Restaurant restaurant;
  List<Item> itemlist;
  Item item;
  bool isshowinternetmsg = true;
  List<String> favresidlist;
  List<String> bookmarkItemIds;
  List<Map> idlistmap;

  @override
  void initState() {
    super.initState();

    itemlist = [
      Item(
          id: 1,
          name: "Burrito with chicken",
          description: "chicken on a plate,totilla cake",
          image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg",
          price: 50,
          categoryId: 1,
          createdAt: "2021-02-18T10:09:05.000000Z",
          updatedAt: "2021-03-04T08:02:48.000000Z",
          available: 1,
          hasVariants: 0,
          vat: 21,
          deletedAt: null,
          logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg",
          icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg",
          shortDescription: "peeled tomatoes, mozzarella salad,...",
          variants: [],
          categoryName: "Salads",
          extras: [Extras(id: 1, itemId: 1, price: "1.199", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
      Item(
          id: 2,
          name: "Homemade Potatoes with Cheddar and Jalapenos (300g)",
          description: "Cheddar cheese, butter, russet...",
          image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_4.jpg",
          price: 50,
          categoryId: 1,
          createdAt: "2021-02-18T10:09:05.000000Z",
          updatedAt: "2021-03-04T08:02:48.000000Z",
          available: 1,
          hasVariants: 0,
          vat: 21,
          deletedAt: null,
          logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_4.jpg",
          icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_4.jpg",
          shortDescription: "peeled tomatoes, mozzarella salad,...",
          variants: [],
          categoryName: "Salads",
          extras: [Extras(id: 1, itemId: 1, price: "2.2", name: "Extra Ketchup", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
      Item(
          id: 3,
          name: "Chicken Taco (250g)",
          description: "chicken on a plate,totilla cake",
          image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_7.jpg",
          price: 3.49,
          categoryId: 1,
          createdAt: "2021-02-18T10:09:05.000000Z",
          updatedAt: "2021-03-04T08:02:48.000000Z",
          available: 1,
          hasVariants: 0,
          vat: 21,
          deletedAt: null,
          logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_7.jpg",
          icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_7.jpg",
          shortDescription: "peeled tomatoes, mozzarella salad,...",
          variants: [],
          categoryName: "Salads",
          extras: [
            Extras(id: 1, itemId: 1, price: "1.1999999999999999555910790149937383830547332763671875", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)
          ]),
      Item(
          id: 4,
          name: "Mozzarella Pizza",
          description: "tomato sauce, mozzarella sabelli,...",
          image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_10.jpg",
          price: 10.99,
          categoryId: 1,
          createdAt: "2021-02-18T10:09:05.000000Z",
          updatedAt: "2021-03-04T08:02:48.000000Z",
          available: 1,
          hasVariants: 0,
          vat: 21,
          deletedAt: null,
          logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_10.jpg",
          icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_10.jpg",
          shortDescription: "peeled tomatoes, mozzarella salad,...",
          variants: [],
          categoryName: "Salads",
          extras: [
            Extras(id: 1, itemId: 1, price: "1.1999999999999999555910790149937383830547332763671875", name: "Extra  Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)
          ]),
    ];
    restaurantlist = [
      Restaurant(
          id: 1,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          name: "Bronx VanNest Restorant",
          subdomain: "Drinks",
          logo: "https://smartkit.wrteam.in/smartkit/foodmaster/Bronx_VanNext_Resto.png",
          cover: "",
          active: "1",
          userId: 1,
          lat: "0",
          lng: "0",
          address: "6 Yukon Drive Raeford, NC 28376",
          phone: "7984765799",
          minimum: "0",
          description: "Drinks, Lunch, Bbq",
          fee: 0,
          staticFee: 0,
          radius: [Radius(lat: 40.2156451454, lng: -73.9118562)],
          isFeatured: 1,
          cityId: 1,
          views: 5,
          canPickup: 1,
          canDeliver: 1,
          selfDeliver: 0,
          freeDeliver: 0,
          whatsappPhone: "123456789",
          fbUsername: null,
          doCovertion: 0,
          currency: "",
          paymentInfo: "",
          molliePaymentKey: "",
          rating: "5",
          alias: "test",
          logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Bronx_VanNext_Resto.png",
          icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Bronx_VanNext_Resto.png",
          coverm: "https://smartkit.wrteam.in/smartkit/foodmaster/Bronx_VanNext_Resto.png",
          isbookmarked: true,
          timeslotlist: [TimeSlot(id: "1", title: "3pm")],
          openingTime: "5:00 AM",
          closingTime: "11:00 PM"),
      Restaurant(
          id: 2,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          name: "Morris Park Burger",
          subdomain: "lunch",
          logo: "https://smartkit.wrteam.in/smartkit/foodmaster/Morris_Park_Burger.png",
          cover: "",
          active: "1",
          userId: 2,
          lat: "0",
          lng: "0",
          address: "8 Sardar nagar",
          phone: "7984765799",
          minimum: "1",
          description: "Italian, International, Pasta",
          fee: 0,
          staticFee: 0,
          radius: [],
          isFeatured: 1,
          cityId: 1,
          views: 4,
          canPickup: 1,
          canDeliver: 1,
          selfDeliver: 0,
          freeDeliver: 0,
          whatsappPhone: "523469871",
          fbUsername: null,
          doCovertion: 0,
          currency: "",
          paymentInfo: "",
          molliePaymentKey: "",
          rating: "4",
          alias: "test1",
          logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Morris_Park_Burger.png",
          icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Morris_Park_Burger.png",
          coverm: "https://smartkit.wrteam.in/smartkit/foodmaster/Morris_Park_Burger.png",
          isbookmarked: false,
          timeslotlist: [TimeSlot(id: "2", title: "4pm")],
          openingTime: "5:00 AM",
          closingTime: "11:00 PM"),
      Restaurant(
          id: 3,
          createdAt: "2021-02-18T11:50:31.000000Z",
          updatedAt: "2021-02-26T12:17:24.000000Z",
          name: "NorWood Burito",
          subdomain: "Dinner",
          logo: "https://smartkit.wrteam.in/smartkit/foodmaster/NorWoodBurito.png",
          cover: "",
          active: "1",
          userId: 3,
          lat: "0",
          lng: "0",
          address: "9 Yukon Drive Raeford, NC 28376, NC 28376",
          phone: "7984765799",
          minimum: "2",
          description: "Drinks, Beef Burgers",
          fee: 0,
          staticFee: 0,
          radius: [],
          isFeatured: 1,
          cityId: 1,
          views: 5,
          canPickup: 1,
          canDeliver: 1,
          selfDeliver: 0,
          freeDeliver: 0,
          whatsappPhone: "123578985",
          fbUsername: null,
          doCovertion: 0,
          currency: "",
          paymentInfo: "",
          molliePaymentKey: "",
          rating: "3",
          alias: "test2",
          logom: "https://smartkit.wrteam.in/smartkit/foodmaster/NorWoodBurito.png",
          icon: "https://smartkit.wrteam.in/smartkit/foodmaster/NorWoodBurito.png",
          coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/NorWoodBurito.png",
          isbookmarked: true,
          timeslotlist: [TimeSlot(id: "3", title: "3pm")],
          openingTime: "5:00 AM",
          closingTime: "11:00 PM"),
    ];
    for (int i = 0; i < restaurantlist.length; i++) {
      restaurant = restaurantlist[i];
    }
    for (int j = 0; j < itemlist.length; j++) {
      item = itemlist[j];
    }
    favresidlist = ["1", "2", "3"];
    bookmarkItemIds = ["1", "2", "3"];
    idlistmap = new List<Map>();
  }

  void setupChannel() {
    favstreamdata = StreamController<String>();
    favstreamdata.stream.listen((response) async {
      favresidlist = restaurant.id.toString() as List<String>;
      if (restaurantlist.isNotEmpty) {
        restaurantlist.removeWhere((element) => !favresidlist.contains(element.id.toString()));
        setState(() {});
      }
    });

    favitemstreamdata = StreamController<String>();
    favitemstreamdata.stream.listen((response) async {
      idlistmap = item.id as List<Map>;

      List<String> newbookmarkItemIds = /*await Constant.db.getAllItemIdList()*/ item.id as List<String>;
      if (itemlist.isNotEmpty) {
        itemlist.removeWhere((element) => !newbookmarkItemIds.contains(element.id.toString()));

        bookmarkItemIds.removeWhere((element) => !newbookmarkItemIds.contains(element));
        setState(() {});
      }

      if (idlistmap.isNotEmpty) {
        idlistmap.map((e) {
          String itemid = e['itemid'];
          if (!bookmarkItemIds.contains(itemid)) {}
        });
      }
    });
  }

  getItemList() async {
    idlistmap = item.id as List<Map>;

    if (idlistmap.isEmpty) {
      isgettingitemdata = false;
      setState(() {});
    } else {
      print("--idlistlen-1//----${idlistmap.length}");
      for (Map map in idlistmap) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsRes.bgcolor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            StringsRes.favourite,
            style: TextStyle(color: ColorsRes.black),
          ),
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: ColorsRes.black,
          ),
          bottom: PreferredSize(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: ColorsRes.appcolor),
              ),
              height: kToolbarHeight - 5,
              child: TabBar(
                labelColor: ColorsRes.white,
                unselectedLabelColor: ColorsRes.appcolor,
                labelStyle: Theme.of(context).textTheme.subtitle1,
                indicator: BoxDecoration(borderRadius: BorderRadius.circular(50), color: ColorsRes.appcolor),
                tabs: [
                  Tab(
                    child: Text(StringsRes.lblrestaurants),
                  ),
                  Tab(
                    child: Text(StringsRes.lblfooditems),
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(kToolbarHeight - 5),
          ),
        ),
        body: TabBarView(
          children: [
            restaurantWidget(),
            itemListWidget(),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    if (homestreamdata != null && !homestreamdata.isClosed) homestreamdata.sink.add("");
    if (favstreamdata != null && !favstreamdata.isClosed) favstreamdata.sink.close();
    if (favitemstreamdata != null && !favitemstreamdata.isClosed) favstreamdata.sink.close();
    super.dispose();
  }

  Widget restaurantWidget() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: restaurantlist.length,
        itemBuilder: (context, index) {
          Restaurant restaurant = restaurantlist[index];

          List<String> descriptionlist = restaurant.description.split(",");

          String favicon = restaurant.isbookmarked ? "favourite_icon" : "favourite_uncheked";

          return GestureDetector(
              onTap: () {
                selectedrestaurant = restaurant;
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (context) => RestaurantDetailTablet(
                          fromfav: true,
                          id: selectedrestaurant.id,
                        )));
              },
              child: Card(
                margin: EdgeInsets.only(bottom: 15),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: DesignConfig.setRoundedBorder(ColorsRes.white, 15, false),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                  Stack(children: [
                    Card(
                      margin: EdgeInsets.all(0),
                      shape: DesignConfig.setRoundedBorder(Colors.white, 15, false),
                      elevation: 0,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: CachedNetworkImage(
                        imageUrl: restaurant.logom,
                        height: 150,
                        width: double.maxFinite,
                        fit: BoxFit.fill,
                      ),
                    ),
                    IntrinsicWidth(
                      child: Container(
                        decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 20),
                        padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                        margin: EdgeInsets.only(left: 5, top: 5),
                        child: Row(children: [
                          Text(
                            restaurant.rating,
                            style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star,
                            color: ColorsRes.yellow,
                            size: 15,
                          ),
                          Text(
                            "(${restaurant.views.toString()})",
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(
                                  color: ColorsRes.grey,
                                )),
                          ),
                        ]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EaseInWidget(
                            child: CachedNetworkImage(
                              imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/$favicon.png",
                              width: MediaQuery.of(context).size.width / 10,
                            ),
                            onTap: () async {
                              restaurantlist.removeAt(index);

                              favresidlist.remove(restaurant.id.toString());

                              setState(() {});
                            }),
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      restaurant.name,
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(children: [
                      if (restaurant.freeDeliver == 1)
                        Row(mainAxisSize: MainAxisSize.min, children: [
                          CachedNetworkImage(
                            imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/freedelivery_icon.png",
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          SizedBox(width: 10),
                          Text(StringsRes.freedelivery),
                          SizedBox(width: 10),
                        ]),
                      Text("${StringsRes.minorder} : ${Constant.currencysymbol}${restaurant.minimum}"),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Wrap(
                        children: List.generate(
                            descriptionlist.length > 10 ? 10 : descriptionlist.length,
                            (index) => Card(
                                  color: ColorsRes.bgcolor,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 3, right: 3, top: 4, bottom: 4),
                                    child: Text(
                                      descriptionlist[index],
                                      style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.black)),
                                    ),
                                  ),
                                  shape: DesignConfig.setRoundedBorder(ColorsRes.lightgrey, 5, false),
                                ))),
                  ),
                ]),
              ));
        });
  }

  Widget itemListWidget() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: itemlist.length,
        itemBuilder: (context, index) {
          Item item = itemlist[index];
          bool isfavitem = bookmarkItemIds.contains(item.id.toString());

          String favitemicon = /*Constant.session.isUserLoggedIn() &&*/ isfavitem ? "favourite_icon" : "favourite_uncheked";
          return GestureDetector(
            onTap: () {
              Restaurant res = new Restaurant();
              res.id = item.restaurantid;
              selectedrestaurant = res;
              selecteditem = item;
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => ItemDetailTablet(
                        isfavitem: true,
                      )));
            },
            child: Card(
              margin: EdgeInsets.only(bottom: 15),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: DesignConfig.setRoundedBorder(ColorsRes.white, 15, false),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
                Stack(children: [
                  Card(
                    margin: EdgeInsets.all(0),
                    shape: DesignConfig.setRoundedBorder(Colors.white, 15, false),
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: item.logom,
                      height: 150,
                      width: double.maxFinite,
                      fit: BoxFit.fill,
                    ),
                  ),
                  IntrinsicWidth(
                    child: Container(
                      decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 20),
                      padding: EdgeInsets.only(left: 8, right: 8, top: 5, bottom: 5),
                      margin: EdgeInsets.only(left: 5, top: 5),
                      child: Row(children: [
                        Text(
                          Constant.currencysymbol,
                          style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "(${item.price})",
                          style: Theme.of(context).textTheme.caption.merge(TextStyle(
                                color: ColorsRes.black,
                              )),
                        ),
                      ]),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EaseInWidget(
                          child: CachedNetworkImage(
                            imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/$favitemicon.png",
                            width: MediaQuery.of(context).size.width / 10,
                          ),
                          onTap: () async {
                            itemlist.removeAt(index);
                            bookmarkItemIds.remove(item.id.toString());

                            setState(() {});
                          }),
                    ),
                  ),
                  if (item.available == 0)
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          decoration: DesignConfig.boxDecorationContainer(ColorsRes.white.withOpacity(0.9), 10),
                          child: Text(
                            StringsRes.itemnotavailable,
                            style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.red, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    )
                ]),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.name,
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text(
                    item.shortDescription,
                    style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(
                          color: ColorsRes.grey,
                        )),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
