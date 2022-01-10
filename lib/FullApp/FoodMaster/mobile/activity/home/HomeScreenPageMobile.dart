import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ease_in_widget.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/Restaurant/RestaurantDetailMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/Restaurant/RestaurantListMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Restaurant.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

import '../MainHomePageMobile.dart';

StreamController<String> homestreamdata;

class HomeScreenPageMobile extends StatefulWidget {
  _HomeScreenPageStateMobile homestate = new _HomeScreenPageStateMobile();

  @override
  _HomeScreenPageStateMobile createState() => homestate;
}

class _HomeScreenPageStateMobile extends State<HomeScreenPageMobile> {
  List<Restaurant> restaurantlist = [
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
        minimum: "1",
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
        rating: "0",
        alias: "test",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Bronx_VanNext_Resto.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Bronx_VanNext_Resto.png",
        coverm: "https://smartkit.wrteam.in/smartkit/foodmaster/Bronx_VanNext_Resto.png",
        isbookmarked: true,
        timeslotlist: [],
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
        minimum: "2",
        description: "Drinks, Lunch, Bbq",
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
        whatsappPhone: "523469871",
        fbUsername: null,
        doCovertion: 0,
        currency: "",
        paymentInfo: "",
        molliePaymentKey: "",
        rating: "0",
        alias: "test1",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Morris_Park_Burger.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Morris_Park_Burger.png",
        coverm: "https://smartkit.wrteam.in/smartkit/foodmaster/Morris_Park_Burger.png",
        isbookmarked: false,
        timeslotlist: [],
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
        minimum: "1",
        description: "Drinks, Lunch, Bbq",
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
        rating: "0",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/NorWoodBurito.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/NorWoodBurito.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/NorWoodBurito.png",
        isbookmarked: true,
        timeslotlist: [],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
    Restaurant(
        id: 4,
        createdAt: "2021-02-18T11:50:31.000000Z",
        updatedAt: "2021-02-26T12:17:24.000000Z",
        name: "Pizza Relham",
        subdomain: "Drinks",
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Relhan.png",
        cover: "",
        active: "1",
        userId: 4,
        lat: "0",
        lng: "0",
        address: "2 Yukon Drive Raeford, NC 28376",
        phone: "7984765799",
        minimum: "2",
        description: "Drinks, Lunch, Bbq",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 2,
        views: 5,
        canPickup: 1,
        canDeliver: 1,
        selfDeliver: 0,
        freeDeliver: 0,
        whatsappPhone: "15647822568",
        fbUsername: null,
        doCovertion: 0,
        currency: "",
        paymentInfo: "",
        molliePaymentKey: "",
        rating: "0",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Relhan.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Relhan.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Relhan.png",
        isbookmarked: false,
        timeslotlist: [],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
    Restaurant(
        id: 5,
        createdAt: "2021-02-18T11:50:31.000000Z",
        updatedAt: "2021-02-26T12:17:24.000000Z",
        name: "Malibu Diner",
        subdomain: "Dinner",
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/Malibu_Diner.png",
        cover: "",
        active: "1",
        userId: 5,
        lat: "0",
        lng: "0",
        address: "3 Yukon Drive Raeford, NC 28376",
        phone: "7984765799",
        minimum: "1",
        description: "Drinks, Lunch, Bbq",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 2,
        views: 5,
        canPickup: 1,
        canDeliver: 1,
        selfDeliver: 0,
        freeDeliver: 0,
        whatsappPhone: "12546682525",
        fbUsername: null,
        doCovertion: 0,
        currency: "",
        paymentInfo: "",
        molliePaymentKey: "",
        rating: "0",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Malibu_Diner.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Malibu_Diner.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Malibu_Diner.png",
        isbookmarked: true,
        timeslotlist: [],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
    Restaurant(
        id: 6,
        createdAt: "2021-02-18T11:50:31.000000Z",
        updatedAt: "2021-02-26T12:17:24.000000Z",
        name: "Vandal Burgers",
        subdomain: "Drinks",
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/NVandal_Burgers.png",
        cover: "",
        active: "1",
        userId: 6,
        lat: "0",
        lng: "0",
        address: "5 Yukon Drive Raeford, NC 28376",
        phone: "7984765799",
        minimum: "2",
        description: "Drinks, Lunch, Bbq",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 3,
        views: 5,
        canPickup: 1,
        canDeliver: 1,
        selfDeliver: 0,
        freeDeliver: 0,
        whatsappPhone: "1458574585585",
        fbUsername: null,
        doCovertion: 0,
        currency: "",
        paymentInfo: "",
        molliePaymentKey: "",
        rating: "0",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Vandal_Burgers.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Vandal_Burgers.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Vandal_Burgers.png",
        isbookmarked: true,
        timeslotlist: [],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
    Restaurant(
        id: 7,
        createdAt: "2021-02-18T11:50:31.000000Z",
        updatedAt: "2021-02-26T12:17:24.000000Z",
        name: "il Buco",
        subdomain: "lunch",
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/il_Buco.png",
        cover: "",
        active: "1",
        userId: 7,
        lat: "0",
        lng: "0",
        address: "2 Yukon Drive Raeford, NC 28376",
        phone: "7984765799",
        minimum: "3",
        description: "Drinks",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 3,
        views: 5,
        canPickup: 1,
        canDeliver: 1,
        selfDeliver: 0,
        freeDeliver: 0,
        whatsappPhone: "12354987",
        fbUsername: null,
        doCovertion: 0,
        currency: "",
        paymentInfo: "",
        molliePaymentKey: "",
        rating: "0",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/il_Buco.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/il_Buco.png",
        coverm: "https://smartkit.wrteam.in/smartkit/foodmaster/il_Buco.png",
        isbookmarked: false,
        timeslotlist: [],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
    Restaurant(
        id: 8,
        createdAt: "2021-02-18T11:50:31.000000Z",
        updatedAt: "2021-02-26T12:17:24.000000Z",
        name: "Pizza Manhattn",
        subdomain: "Dinner",
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Manhattn.png",
        cover: "",
        active: "1",
        userId: 8,
        lat: "0",
        lng: "0",
        address: "10 Yukon Drive Raeford, NC 28376",
        phone: "7984765799",
        minimum: "4",
        description: "Drinks, Lunch,",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 4,
        views: 5,
        canPickup: 1,
        canDeliver: 1,
        selfDeliver: 0,
        freeDeliver: 0,
        whatsappPhone: "1254884",
        fbUsername: null,
        doCovertion: 0,
        currency: "",
        paymentInfo: "",
        molliePaymentKey: "",
        rating: "0",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Manhattn.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Manhattn.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Manhattn.png",
        isbookmarked: true,
        timeslotlist: [],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
  ];
  bool isshowinternetmsg = true;
  List<String> favresidlist;
  List<int> featuredidlist;

  @override
  void initState() {
    super.initState();
    favresidlist = [];
    featuredidlist = [];
  }

  @override
  dispose() {
    if (homestreamdata != null && !homestreamdata.isClosed) homestreamdata.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10), children: [
      Text(
        StringsRes.homepagetitle,
        style: Theme.of(context).textTheme.headline5,
      ),
      SizedBox(height: 15),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => RestaurantListMobile(
                    fromsearch: true,
                  )));
        },
        child: Card(
          color: ColorsRes.lightgrey,
          shape: DesignConfig.setRoundedBorder(ColorsRes.grey, 25, true),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 15, bottom: 15),
            child: Row(children: [
              Icon(
                Icons.search,
                color: ColorsRes.grey,
              ),
              SizedBox(width: 10),
              Text(
                StringsRes.findrestaurant,
                style: TextStyle(color: ColorsRes.grey),
              ),
              SizedBox(width: 10),
            ]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringsRes.lblrestaurants,
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                    color: ColorsRes.black,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(CupertinoPageRoute(
                        builder: (context) => RestaurantListMobile(
                              fromsearch: false,
                            )))
                    .then((value) {
                  setState(() {});
                });
              },
              child: Text(
                StringsRes.viewall,
                style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.IconColor, decoration: TextDecoration.underline)),
              ),
            )
          ],
        ),
      ),
      restaurantWidget(),
    ]);
  }

  Widget restaurantWidget() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: restaurantlist.length,
        itemBuilder: (context, index) {
          Restaurant restaurant = restaurantlist[index];
          List<String> descriptionlist = restaurant.description.split(",");
          bool isfav = favresidlist.contains(restaurant.id.toString());
          String favicon = isfav //restaurant.isbookmarked
              ? "favourite_icon"
              : "favourite_uncheked";

          return GestureDetector(
            onTap: () {
              selectedrestaurant = restaurant;
              Navigator.of(context)
                  .push(CupertinoPageRoute(
                      builder: (context) => RestaurantDetailMobile(
                            fromfav: false,
                            id: selectedrestaurant.id,
                          )))
                  .then((value) {
                setState(() {});
              });
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
                        imageUrl: '${restaurant.logom}',
                        height: 150,
                        width: double.maxFinite,
                        fit: BoxFit.fill,
                      )),
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
                          onTap: () {
                            bool newval = !isfav;
                            restaurantlist[index].isbookmarked = newval;
                            if (newval)
                              favresidlist.add(restaurant.id.toString());
                            else
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
                    Text("${StringsRes.minorder} : ${Constant.currencysymbol}${int.parse(restaurant.minimum).toStringAsFixed(2)}"),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Wrap(
                      children: List.generate(
                    descriptionlist.length > 10 ? 10 : descriptionlist.length,
                    (index) => /* Card(
                                    color: ColorsRes.bgcolor,
                                    child:*/
                        Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3, top: 4, bottom: 4),
                      child: Text(
                        descriptionlist[index] + ",",
                        style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.grey)),
                      ),
                    ),
                  )),
                ),
              ]),
            ),
          );
        });
  }
}
