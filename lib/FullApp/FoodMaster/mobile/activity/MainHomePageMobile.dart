import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/drawerstyle/drawerbehavior.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/CartPayment/CartListPageMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/Order/OrderListMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/Restaurant/RestaurantListMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/TermsConditionActivityMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/home/HomeScreenPageMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/profile/AddressListMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/profile/FavouriteListMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/profile/UserInfoPageMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Restaurant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'package:smartkit/services/auth_service.dart';

import 'Notification/NotificationListMobile.dart';
import 'authentication/LoginHomePageMobile.dart';
import 'dart:io' show Platform;

Restaurant selectedrestaurant;
Item selecteditem;

class MainHomePageMobile extends StatefulWidget {
  final String from;
  const MainHomePageMobile({
    Key key,
    this.from,
  }) : super(key: key);
  @override
  _MainHomePageStateMobile createState() => _MainHomePageStateMobile();
}

class _MainHomePageStateMobile extends State<MainHomePageMobile> {
  Future<SharedPreferences> _sprefs = SharedPreferences.getInstance();
  int selectedMenuItemId;
  List<MenuItem> menuitems = [];
  HomeScreenPageMobile homepage;
  int counter;
  AuthServices authServices = AuthServices();
  List<Item> itemlist = [
    Item(
        id: 1,
        name: "Salads",
        description: "v",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "1.19", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 2,
        name: "Pizza",
        description: "peeled tomatoes, mozzarella salad, Genovese pest tortilla tortilla 16cm, veal minced...o",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "2.22", name: "Extra Ketchup", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 3,
        name: "Fresh Pasta and Risotto",
        description: "veal or minced meat(specify),tortilla...",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 2,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "3.33", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 4,
        name: "Burrito with chicken",
        description: "chicken on a plate,totilla cake",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 2,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "4.44", name: "Extra  Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 5,
        name: "Burrito Veggie",
        description: "peeled tomatoes, mozzarella salad, Genovese pesto",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 3,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "5.55", name: "Extra Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 6,
        name: "Burrito with beef roast",
        description: "veal or minced meat(specify),tortilla...",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 3,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "6.66", name: "Extra salad", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 1,
        name: "Salads",
        description: "v",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 4,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "7.77", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 2,
        name: "Pizza",
        description: "peeled tomatoes, mozzarella salad, Genovese pest tortilla tortilla 16cm, veal minced...o",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 4,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "8.88", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 3,
        name: "Fresh Pasta and Risotto",
        description: "veal or minced meat(specify),tortilla...",
        image: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",
        price: 50,
        categoryId: 5,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        icon: "https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "9.99", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
  ];
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
        minimum: "3",
        description: "Tacos, Wraps, Quesadilla",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 2,
        views: 3,
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
        rating: "5",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Relhan.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Relhan.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Relhan.png",
        isbookmarked: false,
        timeslotlist: [TimeSlot(id: "4", title: "4pm")],
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
        minimum: "4",
        description: "Drinks, lunch, bbq",
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
        rating: "4",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Malibu_Diner.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Malibu_Diner.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Malibu_Diner.png",
        isbookmarked: true,
        timeslotlist: [TimeSlot(id: "5", title: "5pm")],
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
        minimum: "5",
        description: "Drinks, Lunch, Bbq",
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
        whatsappPhone: "1458574585585",
        fbUsername: null,
        doCovertion: 0,
        currency: "",
        paymentInfo: "",
        molliePaymentKey: "",
        rating: "3",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Vandal_Burgers.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Vandal_Burgers.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Vandal_Burgers.png",
        isbookmarked: true,
        timeslotlist: [TimeSlot(id: "6", title: "6pm")],
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
        minimum: "0",
        description: "Drinks",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 3,
        views: 3,
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
        rating: "4",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/il_Buco.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/il_Buco.png",
        coverm: "https://smartkit.wrteam.in/smartkit/foodmaster/il_Buco.png",
        isbookmarked: false,
        timeslotlist: [TimeSlot(id: "7", title: "7pm")],
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
        minimum: "1",
        description: "Italian, International, Pasta",
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
        rating: "5",
        alias: "test2",
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Manhattn.png",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Manhattn.png",
        coverm: "ahttps://smartkit.wrteam.in/smartkit/foodmaster/Pizza_Manhattn.png",
        isbookmarked: true,
        timeslotlist: [TimeSlot(id: "8", title: "2pm")],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
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
  Item item;
  Restaurant restaurant;

  // Future<Null> getData() async {
  //   final SharedPreferences prefs = await _sprefs;
  //   int data = int.parse((prefs.getString('counter')));
  //   this.setState(() {
  //     counter = data;
  //     print("counter is=====" + counter.toString());
  //   });
  // }

  void initState() {
    super.initState();
    selectedMenuItemId = 0;
    homepage = new HomeScreenPageMobile();
    counter = 1;
    getData1();
    setState(() {
      // getData();
    });
    for (int i = 0; i < itemlist.length; i++) {
      item = itemlist[i];
    }
    for (int j = 0; j < restaurantlist.length; j++) {
      restaurant = restaurantlist[j];
    }
    for (int k = 0; k < displayextraslist.length; k++) {
      extras = displayextraslist[k];
    }
  }

  getData1() async {
    setMeuItems();
  }

  setMeuItems() {
    menuitems = [];
    menuitems = [
      new MenuItem<int>(
        id: 0,
        title: StringsRes.myprofile,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/myprofile_icon.png",
          width: 28,
          height: 28,
          color: ColorsRes.IconColor,
        ),
      ),
    ];
    menuitems.addAll([
      new MenuItem<int>(
        id: 5,
        title: StringsRes.lblrestaurants,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/restaurant_dropdown.png",
          color: ColorsRes.IconColor,
          width: 28,
          height: 28,
        ),
      ),
      new MenuItem<int>(
        id: 1,
        title: StringsRes.myorders,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/myorder_icon.png",
          color: ColorsRes.IconColor,
          width: 28,
          height: 28,
        ),
      ),
      new MenuItem<int>(
        id: 2,
        title: StringsRes.deliveryaddress,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/deliveryaddress_icon.png",
          color: ColorsRes.IconColor,
          width: 28,
          height: 28,
        ),
      ),
      new MenuItem<int>(
        id: 3,
        title: StringsRes.notifications,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/notification_dropdown.png",
          color: ColorsRes.IconColor,
          width: 28,
          height: 28,
        ),
      ),
      new MenuItem<int>(
        id: 4,
        title: StringsRes.favourite,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/Favourite_dropdown.png",
          // color: ColorsRes.IconColor,
          width: 28,
          height: 28,
        ),
      ),
    ]);

    //

    menuitems.addAll([
      new MenuItem<int>(
        id: 6,
        title: StringsRes.termsandcondition,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/terms_dropdown.png",
          color: ColorsRes.IconColor,
          width: 28,
          height: 28,
        ),
      ),
      new MenuItem<int>(
        id: 7,
        title: StringsRes.privacypolicy,
        icon: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/privacypolicy_dropdown.png",
          color: ColorsRes.IconColor,
          width: 28,
          height: 28,
        ),
      ),
    ]);
  }

  Widget drawerHeader() {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(
        radius: 40,
        child: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/splash_logo.png",
          width: 60,
        ),
      ),
      Text("abc", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold))),
      Text(
        "abc@gmail.com",
        style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MyHomePage()), (Route<dynamic> route) => false);
      },
      child: DrawerScaffold(
        appBar: AppBar(
            backgroundColor: ColorsRes.bgcolor,
            elevation: 0,
            centerTitle: true,
            title: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/title_icon.png"),
            brightness: Brightness.light,
            iconTheme: IconThemeData(
              color: ColorsRes.black,
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.person),
                  color: ColorsRes.IconColor,
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => UserInfoPageMobile()));
                  }),
              ButtonClickAnimation(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CartListPageMobile(
                            id: 1,
                            id1: 3.toString(),
                            id2: 1.toString(),
                            name: "Fresh Pasta and Risotto",
                            price: 50,
                            logom: item.logom,
                            description: "peeled tomatoes, mozzarella salad,...",
                            extra: "Extra Sauce",
                            address: ", 123,xyz",
                            phone: "1234567890",
                            timeslot: ["10:00", "11:00"],
                            openTime: "09:00 AM",
                            closeTime: "11:00 PM",
                            mini: "2")),
                  );
                },
                child: Stack(alignment: Alignment.center, children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: /*Constant.session.getIntData(SessionManager.KEY_CARTTOTAL) == 0 ? 8*/ 20),
                    child: CachedNetworkImage(
                      imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/cartbag_icon.png",
                      width: MediaQuery.of(context).size.width / 20,
                      color: ColorsRes.IconColor,
                    ),
                  ),
                  new Align(
                    alignment: Alignment.topRight,
                    child: IntrinsicHeight(
                      child: new Container(
                        decoration: DesignConfig.boxDecorationContainer(ColorsRes.yellow, 5),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 3, left: 5),
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
              ),
            ]),
        onSlide: (drawer, value) {
          //debugPrint("[LOG] Drawer ${drawer.direction} $value");
        },
        onOpened: (drawer) {
          //debugPrint("[LOG] Drawer ${drawer.direction} opened");
        },
        onClosed: (drawer) {
          //debugPrint("[LOG] Drawer ${drawer.direction} closed");
        },
        drawers: [
          SideDrawer(
              percentage: 0.8,
              drawerWidth: MediaQuery.of(context).size.width - 80,
              padding: EdgeInsets.only(left: 20, top: 15, bottom: 15),
              menu: Menu(items: menuitems),
              direction: Direction.left,
              animation: true,
              color: ColorsRes.bgcolor,
              selectedItemId: selectedMenuItemId,
              onMenuItemSelected: (itemId) {
                setState(() {
                  selectedMenuItemId = itemId;
                });
                openSpecifiPage(itemId);
              },
              alignment: Alignment.topLeft,
              headerView: Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20, top: kToolbarHeight),
                child: drawerHeader(),
              ),
              footerView: GestureDetector(
                  onTap: () {
                    // Constant.session.logoutUser();
                    setMeuItems();
                    //  homepage.loadHomeData();
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(color: ColorsRes.IconColor, borderRadius: BorderRadius.circular(23), boxShadow: [
                      BoxShadow(
                        color: ColorsRes.IconColor.withOpacity(0.2),
                        spreadRadius: 8,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]),
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(left: 20, bottom: 20),
                    child: GestureDetector(
                        onTap: () {
                          authServices.authSignOutUser(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginHomePageMobile(
                                      from: "intro",
                                    )),
                          );
                        },
                        child: Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                          CircleAvatar(
                              backgroundColor: ColorsRes.white,
                              radius: 15,
                              child: Icon(
                                Icons.power_settings_new,
                                size: 20,
                                color: ColorsRes.appcolor,
                              )),
                          SizedBox(width: 10),
                          Text(
                            StringsRes.lbllogout.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                        ])),
                  )))
        ],
        builder: (context, id) {
          return homepage;
        },
      ),
    );
  }

  void openSpecifiPage(itemId) {
    if (itemId == 0) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => UserInfoPageMobile()));
    } else if (itemId == 1) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => OrderListMobile()));
    } else if (itemId == 2) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => AddressListMobile()));
    } else if (itemId == 3) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => NotificationListMobile()));
    } else if (itemId == 4) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => FavouriteListMobile()));
    } else if (itemId == 5) {
      Navigator.of(context).push(CupertinoPageRoute(
          builder: (context) => RestaurantListMobile(
                fromsearch: false,
              )));
    } else if (itemId == 6) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => TermsConditionActivityMobile()));
    } else if (itemId == 7) {
      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => TermsConditionActivityMobile()));
    }
  }
}
