import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/Restaurant/ReviewListDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/home/HomeScreenPageDesktop.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/activity/profile/FavouriteListDesktop.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ease_in_widget.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/new_dialog.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Category.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Item.dart';
import '../MainHomePageDesktop.dart';
import '../Restaurant/ItemDetailDesktop.dart';
import 'RestaurantListDesktop.dart';

StreamController<String> resdetailstreamdata;

class RestaurantDetailDesktop extends StatefulWidget {
  final bool fromfav;
  final int id;
  const RestaurantDetailDesktop({
    Key key,
    this.fromfav,
    this.id,
  }) : super(key: key);
  @override
  _RestaurantDetailStateDesktop createState() => _RestaurantDetailStateDesktop();
}

class _RestaurantDetailStateDesktop extends State<RestaurantDetailDesktop> {
  bool isfav = false;
  bool istouchfav = false;
  bool istouchitemfav = false;
  String favicon = "favourite_uncheked";
  ScrollController _hideButtonController;
  var _isVisible;
  double expandheight = 350;
  GlobalKey<ScaffoldState> scaffoldKey;
  List<String> descriptionlist = selectedrestaurant.description.split(",");
  List<Category> categorylist = [
    Category(id: "1", name: "Salads", restorantid: "1", createdat: "2021-02-18T10:09:05.000000Z", updatedat: "2021-02-18T10:09:05.000000Z", orderindex: "0", active: "1"),
    Category(id: "2", name: "Pizza", restorantid: "2", createdat: "2021-02-18T10:09:05.000000Z", updatedat: "2021-02-18T10:09:05.000000Z", orderindex: "0", active: "1"),
    Category(id: "3", name: "Fresh Pasta and Risotto", restorantid: "3", createdat: "2021-02-18T10:09:05.000000Z", updatedat: "2021-02-18T10:09:05.000000Z", orderindex: "0", active: "1"),
    Category(id: "4", name: "Lasagna", restorantid: "4", createdat: "2021-02-18T10:09:05.000000Z", updatedat: "2021-02-18T10:09:05.000000Z", orderindex: "0", active: "1"),
  ];
  Category selectedcategory;
  List<Item> itemlist = [
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
        extras: [Extras(id: 1, itemId: 1, price: "1.19", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 1,
        name: "Burrito Veggie",
        description: "peeled tomatoes, mozzarella salad, Genovese pesto",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        price: 60,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "2.19", name: "Extra Ketchup", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 1,
        name: "Burrito with beef roast",
        description: "veal or minced meat(specify),tortilla...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        price: 70,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "3.19", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 2,
        name: "Homemade Potatoes with Cheddar and Jalapenos (300g)",
        description: "Cheddar cheese, butter, russet...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_4.jpg",
        price: 80,
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
        id: 2,
        name: "Homemade Potatoes with Ranch Sauce (300g)",
        description: "Sour cream, ranch dressing, bacon,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_5.jpg",
        price: 90,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_5.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_5.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "1", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 2,
        name: "Cheddar Sticks (250g)",
        description: "String cheese, bread crumbs, smoked...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_6.jpg",
        price: 40,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_6.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_6.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "5", name: "Extra Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
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
        extras: [Extras(id: 1, itemId: 1, price: "1.65", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 3,
        name: "Taco with beef roasted meat (250g)",
        description: "peeled tomatoes, mozzarella salad, Genovese pesto",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_8.jpg",
        price: 3.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_8.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_8.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "1.85", name: "Extra Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 3,
        name: " Pork Taco (250g)",
        description: "v16cm tortilla cake, pork roast,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_9.jpg",
        price: 3.49,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_9.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_9.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "1.22", name: "Extra Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
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
        extras: [Extras(id: 1, itemId: 1, price: "1.88", name: "Extra  Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 4,
        name: " Prosciutto crust pizza",
        description: "tomato sauce, mozzarella sabelli,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_11.jpg",
        price: 14.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_11.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_11.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "7.19", name: "Extra  cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 4,
        name: " Pepperoni Pizza",
        description: "tomato sauce, mozzarella Sabelli,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_12.jpg",
        price: 14.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_12.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_12.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "9.19", name: "Extra Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 5,
        name: "Mozzarella Pizza",
        description: "tomato sauce, mozzarella sabelli,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_9.jpg",
        price: 10.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_9.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_9.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "5.19", name: "Extra Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 5,
        name: " Prosciutto crust pizza",
        description: "tomato sauce, mozzarella sabelli,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_10.jpg",
        price: 14.99,
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
        extras: [Extras(id: 1, itemId: 1, price: "8.89", name: "Extra Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 5,
        name: " Pepperoni Pizza",
        description: "tomato sauce, mozzarella Sabelli,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_11.jpg",
        price: 14.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_11.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_11.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "6.10", name: "Extra Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 6,
        name: "Homemade french fries with ranch sauce (150g)",
        description: "French fries, homemade ranch dressing,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_12.jpg",
        price: 2.98,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_12.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_12.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "5.19", name: "Extra salad", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 6,
        name: " Homemade french fries with cheddar and jalapenos (190g)",
        description: "tOlive oil, cheddar, green mix",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_13.jpg",
        price: 3.9699999999999998,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_13.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_13.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "8.16", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 6,
        name: " Homemade french fries (100g)",
        description: "100g",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_14.jpg",
        price: 1.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_14.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_14.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "3.15", name: "Extra Sauce", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 7,
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
        extras: [Extras(id: 1, itemId: 1, price: "5.69", name: "Extra cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 7,
        name: "Burrito Veggie",
        description: "peeled tomatoes, mozzarella salad, Genovese pesto",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        price: 50,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "8.59", name: " Extra Ketchup", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 7,
        name: "Burrito with beef roast",
        description: "veal or minced meat(specify),tortilla...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        price: 50,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "3.79", name: "Extra Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 8,
        name: "Spaghetti Carbonara (450g)",
        description: "fresh pasta, cream (animal), onion,..",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_13.jpg",
        price: 11.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_13.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_13.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "2.15", name: "Extra  Cold Drinks", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 8,
        name: "Spaghetti Formaggi (450g)",
        description: " fresh pasta, cream (animal), blue...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_14.jpg",
        price: 11.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_15.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_14.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "7.11", name: "Extra  cheese", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
    Item(
        id: 8,
        name: "Tagliatelle with mushrooms (400g)",
        description: "fresh pasta, cream (animal), mushrooms,...",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_15.jpg",
        price: 11.99,
        categoryId: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-03-04T08:02:48.000000Z",
        available: 1,
        hasVariants: 0,
        vat: 21,
        deletedAt: null,
        logom: "https://smartkit.wrteam.in/smartkit/foodmaster/detail_17.jpg",
        icon: "https://smartkit.wrteam.in/smartkit/foodmaster/Detail_15.jpg",
        shortDescription: "peeled tomatoes, mozzarella salad,...",
        variants: [],
        categoryName: "Salads",
        extras: [Extras(id: 1, itemId: 1, price: "5.59", name: "Drink", createdAt: "2021-02-18T10:09:05.000000Z", updatedAt: "2021-02-18T10:09:05.000000Z", deletedAt: null, extraForAllVariants: 1)]),
  ];
  List<Item> allitemlist = [
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
        price: 70,
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
        price: 80,
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
        price: 90,
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
        price: 30,
        categoryId: 4,
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
    /* Item(id:1,name:"Salads",description:"v",image:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",price:50,categoryId:4,createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-03-04T08:02:48.000000Z",available:1,hasVariants:0,vat:21,deletedAt:null,logom:"https://smartkit.wrteam.in/smartkit/foodmaster/Detail_1.jpg",icon:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",shortDescription:"peeled tomatoes, mozzarella salad,...",variants:[],categoryName:"Salads",extras:[Extras(id:1,itemId:1,price:"7.77",name:"Extra cheese",createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-02-18T10:09:05.000000Z",deletedAt:null,extraForAllVariants:1)]),
     Item(id:2,name:"Pizza",description:"peeled tomatoes, mozzarella salad, Genovese pest tortilla tortilla 16cm, veal minced...o",image:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",price:50,categoryId:4,createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-03-04T08:02:48.000000Z",available:1,hasVariants:0,vat:21,deletedAt:null,logom:"https://smartkit.wrteam.in/smartkit/foodmaster/Detail_2.jpg",icon:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",shortDescription:"peeled tomatoes, mozzarella salad,...",variants:[],categoryName:"Salads",extras:[Extras(id:1,itemId:1,price:"8.88",name:"Extra cheese",createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-02-18T10:09:05.000000Z",deletedAt:null,extraForAllVariants:1)]),
     Item(id:3,name:"Fresh Pasta and Risotto",description:"veal or minced meat(specify),tortilla...",image:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82",price:30,categoryId:5,createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-03-04T08:02:48.000000Z",available:1,hasVariants:0,vat:21,deletedAt:null,logom:"https://smartkit.wrteam.in/smartkit/foodmaster/Detail_3.jpg",icon:"https:\/\/foodtiger.mobidonia.com\/uploads\/restorants\/bd5292e7-e898-479d-8921-4c47a776ba82_thumbnail.jpg",shortDescription:"peeled tomatoes, mozzarella salad,...",variants:[],categoryName:"Salads",extras:[Extras(id:1,itemId:1,price:"9.99",name:"Extra cheese",createdAt:"2021-02-18T10:09:05.000000Z",updatedAt:"2021-02-18T10:09:05.000000Z",deletedAt:null,extraForAllVariants:1)]),
*/
  ];
  List<String> bookmarkItemIds;
  Item allItem;
  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    categorylist;
    _isVisible = false;
    _hideButtonController = new ScrollController();
    categorylist;
    itemlist;
    for (int i = 0; i < allitemlist.length; i++) {
      allItem = allitemlist[i];
    }
    bookmarkItemIds = [];
    checkfav();
    backbtnVisibility();
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

      if (_hideButtonController.offset >= _hideButtonController.position.maxScrollExtent && !_hideButtonController.position.outOfRange) {
        print("reach the bottom");
      }
    });
  }

  @override
  dispose() {
    if (istouchfav) {
      if (widget.fromfav && favstreamdata != null && !favstreamdata.isClosed)
        favstreamdata.sink.add("");
      else {
        if (homestreamdata != null && !homestreamdata.isClosed) homestreamdata.sink.add("");
        if (restaurantstream != null && !restaurantstream.isClosed) restaurantstream.sink.add("");
      }
    }

    if (istouchitemfav && widget.fromfav && favitemstreamdata != null && !favitemstreamdata.isClosed) favitemstreamdata.sink.add("");

    if (resdetailstreamdata != null && !resdetailstreamdata.isClosed) resdetailstreamdata.sink.close();

    super.dispose();
  }

  checkfav() async {
    isfav = selectedrestaurant.isbookmarked;
    favicon = isfav ? "favourite_icon" : "favourite_uncheked";

    setState(() {});
  }

  /*getItemListByCategory() {
    String cateid = selectedcategory.id;
    itemlist.clear();
    itemlist.addAll(allitemlist.where((element) => element.id.toString() == cateid).toList());
    allitemlist;
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: ColorsRes.IconColor,
        onPressed: () {
          openCategoryDialogue();
        },
        child: new Icon(Icons.filter_alt),
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
            actions: [
              if (_isVisible) favouriteWidget(),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _isVisible ? selectedrestaurant.name : '',
                style: TextStyle(color: Colors.black),
              ),
              background: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    Card(
                        shape: DesignConfig.setRoundedBorder(ColorsRes.appcolor, 15, false),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        margin: EdgeInsets.all(20),
                        child: CachedNetworkImage(
                          imageUrl: selectedrestaurant.logom,
                          height: 400,
                          width: double.maxFinite,
                          fit: BoxFit.fill,
                        )),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 30, top: kToolbarHeight - MediaQuery.of(context).padding.top),
                        child: favouriteWidget(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        backgroundColor: ColorsRes.white,
                        radius: 58,
                        child: ClipOval(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: CachedNetworkImage(
                              imageUrl: selectedrestaurant.icon,
                              height: 95,
                              width: 95,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            expandedHeight: expandheight,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Item item = itemlist[index];
                return Column(
                  children: [
                    if (index == 0) Opacity(opacity: _isVisible ? 0 : 1, child: restaurantInfoWidget()),
                    //if (widget.id.toString() == item.id.toString()) itemWidget(item),
                  ],
                );
              },
              childCount: itemlist.length,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 2,
              mainAxisExtent: 500,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                Item item = itemlist[index];
                return Column(
                  children: [
                    //if (index == 0) Opacity(opacity: _isVisible ? 0 : 1, child: restaurantInfoWidget()),
                    if (widget.id.toString() == item.id.toString()) itemWidget(item),
                  ],
                );
              },
              childCount: itemlist.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget restaurantInfoWidget() {
    return Column(children: [
      Text(
        selectedrestaurant.name,
        style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      ),
      Text(
        selectedrestaurant.address,
        style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.grey)),
      ),
      Wrap(
          children: List.generate(
              descriptionlist.length,
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
      if (selectedrestaurant.openingTime.trim().isNotEmpty && selectedrestaurant.closingTime.trim().isNotEmpty)
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/time_icon.png"),
              SizedBox(width: 5),
              Text(selectedrestaurant.openingTime),
              Text(" to\t"),
              Text(selectedrestaurant.closingTime),
              SizedBox(width: 10),
            ])),
      if (selectedrestaurant.freeDeliver == 1 || selectedrestaurant.doCovertion == 1)
        Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (selectedrestaurant.freeDeliver == 1)
                Row(mainAxisSize: MainAxisSize.min, children: [
                  CachedNetworkImage(
                    imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/freedelivery_icon.png",
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  SizedBox(width: 5),
                  Text(StringsRes.freedelivery),
                ]),
              if (selectedrestaurant.doCovertion == 1)
                GestureDetector(
                  onTap: () async {
                    if (selectedrestaurant.phone != null && selectedrestaurant.phone.trim().isNotEmpty) {
                      String url = 'tel:${selectedrestaurant.phone}';
                      if (await canLaunch(url) == null) {
                        throw 'Could not launch $url';
                      } else {
                        await launch(url);
                      }
                    }
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.call,
                      color: ColorsRes.appcolor,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(selectedrestaurant.phone, style: TextStyle(decoration: TextDecoration.underline)),
                  ]),
                ),
            ])),
      Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (selectedrestaurant.lat.trim().isNotEmpty && selectedrestaurant.lng.trim().isNotEmpty)
              GestureDetector(
                  onTap: () async {
                    final url = 'https://www.google.com/maps/search/?api=1&query=${selectedrestaurant.lat},${selectedrestaurant.lng}';

                    if (await canLaunch(url) != null) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.location_on,
                      color: ColorsRes.IconColor,
                      size: 14,
                    ),
                    SizedBox(width: 5),
                    Text(StringsRes.locate, style: TextStyle(decoration: TextDecoration.underline)),
                    SizedBox(width: 10),
                  ])),
            GestureDetector(
                onTap: () async {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => ReviewListDesktop(resid: selectedrestaurant.id))).then((value) {
                    setState(() {});
                  });
                },
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(
                    Icons.star,
                    color: ColorsRes.IconColor,
                    size: 14,
                  ),
                  SizedBox(width: 5),
                  Text(StringsRes.reviews, style: TextStyle(decoration: TextDecoration.underline)),
                ])),
          ])),
    ]);
  }

  Widget itemWidget(Item item) {
    bool isfavitem = bookmarkItemIds.contains(item.id.toString());
    String favitemicon = isfavitem ? "favourite_icon" : "favourite_uncheked";
    return GestureDetector(
      onTap: () {
        selecteditem = item;
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => ItemDetailDesktop(
                      isfavitem: isfavitem,
                    )))
            .then((value) {
          setState(() {});
        });
      },
      child: Expanded(
        child: Card(
          margin: EdgeInsets.only(top: 12, bottom: 3, left: 10, right: 10),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: DesignConfig.setRoundedBorder(ColorsRes.white, 15, false),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
            Stack(children: [
              Card(
                margin: EdgeInsets.all(0),
                shape: DesignConfig.setRoundedBorder(Colors.white, 15, false),
                elevation: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Expanded(
                  child: CachedNetworkImage(
                    imageUrl: item.logom,
                    height: 150,
                    width: double.maxFinite,
                    fit: BoxFit.fill,
                  ),
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
                      style: TextStyle(color: ColorsRes.IconColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "${item.price.toStringAsFixed(2)}",
                      style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
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
                        bool newval = !isfavitem;
                        istouchitemfav = true;
                        if (newval)
                          bookmarkItemIds.add(item.id.toString());
                        else
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
                      child: Expanded(
                        child: Text(
                          StringsRes.itemnotavailable,
                          style: Theme.of(context).textTheme.caption.merge(TextStyle(color: ColorsRes.red, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                )
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: Text(
                  item.name,
                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              child: Expanded(
                child: Text(
                  item.shortDescription,
                  style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(
                        color: ColorsRes.grey,
                      )),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void openCategoryDialogue() {
    showNewDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${selectedrestaurant.name} ${StringsRes.categories}"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(categorylist.length, (index) {
                Category category = categorylist[index];
                bool isselected = selectedcategory != null && selectedcategory.id == category.id ? true : false;

                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: EaseInWidget(
                      onTap: () {
                        itemlist.clear();
                        itemlist.addAll(allitemlist.where((element) => element.id.toString() == category.id));
                        print(allItem.id.toString() + "         " + category.id.toString());
                        allitemlist;
                        setState(() {});
                        Navigator.of(context).pop();
                      },
                      child: RichText(
                          text: TextSpan(
                        text: category.name,
                        style: TextStyle(
                          color: isselected ? ColorsRes.white : ColorsRes.black,
                          background: new Paint()
                            ..color = isselected ? ColorsRes.appcolor : ColorsRes.lightgrey
                            ..strokeJoin = StrokeJoin.round
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 20,
                        ),
                      ))),
                );
              }),
            ),
          ),
        );
      },
    );
  }

  Widget favouriteWidget() {
    return EaseInWidget(
        child: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/$favicon.png",
          width: MediaQuery.of(context).size.width / 10,
        ),
        onTap: () async {
          bool newval = !isfav;
          istouchfav = true;
          favicon = newval ? "favourite_icon" : "favourite_uncheked";
          setState(() {});
        });
  }
}
