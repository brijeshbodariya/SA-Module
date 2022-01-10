import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/activity/authentication/LoginActivity.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ease_in_widget.dart';
import 'package:smartkit/FullApp/FoodMaster/model/City.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Restaurant.dart';
import '../MainHomePage.dart';
import '../home/HomeScreenPage.dart';
import 'RestaurantDetail.dart';

StreamController<String> restaurantstream;

class RestaurantList extends StatefulWidget {
  final bool fromsearch;
  const RestaurantList({
    Key key,
    this.fromsearch,
  }) : super(key: key);
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
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

  List<Restaurant> restaurantlist1 = [
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
        rating: "0",
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
        minimum: "0",
        description: "Italian, International, Pasta",
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
        minimum: "0",
        description: "Drinks, Beef Burgers",
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
        minimum: "0",
        description: "Tacos, Wraps, Quesadilla",
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
        minimum: "0",
        description: "Drinks, Lunch, Bbq",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 5,
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
        minimum: "0",
        description: "Drinks, Lunch, Bbq",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 6,
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
        cityId: 7,
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
        minimum: "0",
        description: "Italian, International, Pasta",
        fee: 0,
        staticFee: 0,
        radius: [],
        isFeatured: 1,
        cityId: 8,
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
        timeslotlist: [TimeSlot(id: "8", title: "2pm")],
        openingTime: "5:00 AM",
        closingTime: "11:00 PM"),
  ];

  List<City> citylist = [
    City(
        id: 1,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Brooklyn",
        alias: "br",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_1.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Brooklyn<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_1.jpg"),
    City(
        id: 2,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Queens",
        alias: "qe",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_2.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Queens<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_2.jpg"),
    City(
        id: 3,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Manhattn",
        alias: "mh",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_3.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Manhattn<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_3.jpg"),
    City(
        id: 4,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Richmond",
        alias: "ri",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_4.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Richmond<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_4.jpg"),
    City(
        id: 5,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Buffalo",
        alias: "bf",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_5.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Buffalo<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_5.jpg"),
    City(
        id: 6,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Rochester",
        alias: "rh",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_6.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Rochester<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_6.jpg"),
    City(
        id: 7,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Yonkers",
        alias: "yo",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_7.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Yonkers<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_7.jpg"),
    City(
        id: 8,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Syracuse",
        alias: "sy",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_8.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Syracuse<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_8.jpg"),
    City(
        id: 9,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Albany",
        alias: "al",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_9.jpg",
        headerTitle: "Food Delivery from<br \/><strong>Albany<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_9.jpg"),
    City(
        id: 10,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "New Rochelle",
        alias: "nr",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_10.jpg",
        headerTitle: "Food Delivery from<br \/><strong>New Rochelle<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_10.jpg"),
    City(
        id: 11,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Mount Vernon",
        alias: "mv",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_11.jpg",
        headerTitle: "Food Delivery from<br \/><strong> Mount Vernon<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_11.jpg"),
    City(
        id: 12,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Schenectady",
        alias: " sc",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_12.jpg",
        headerTitle: "Food Delivery from<br \/><strong> Schenectady<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_12.jpg"),
    City(
        id: 13,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Utica",
        alias: "ut",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_13.jpg",
        headerTitle: "Food Delivery from<br \/><strong> Utica<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_13.jpg"),
    City(
        id: 14,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: " White Plains",
        alias: " wp",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_14.jpg",
        headerTitle: "Food Delivery from<br \/><strong>  White Plains<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_14.jpg"),
    City(
        id: 15,
        createdAt: "2021-02-18T10:09:05.000000Z",
        updatedAt: "2021-02-18T10:09:05.000000Z",
        name: "Niagara Falls",
        alias: " nf",
        image: "https://smartkit.wrteam.in/smartkit/foodmaster/City_15.jpg",
        headerTitle: "Food Delivery from<br \/><strong>  Niagara Falls<\/strong>\u2019s Best Restaurants",
        headerSubtitle: "The meals you love, delivered with care",
        deletedAt: null,
        logo: "https://smartkit.wrteam.in/smartkit/foodmaster/City_15.jpg"),
  ];
  Restaurant restaurant;
  City city;
  String restauranttype = Constant.restaurantAll;
  String cityid = "0";
  List<String> favresidlist;
  bool isloading = false;
  TextEditingController searchcontroller = new TextEditingController();
  //int offset = 0;
  //int limit = 10;
  bool isloadmore = true;
  String searchText = '';
  bool ispageLoading = false;
  GlobalKey<ScaffoldState> scaffoldKey;
  List<int> residlist;

  @override
  void initState() {
    super.initState();
    scaffoldKey = GlobalKey<ScaffoldState>();
    restaurantlist;

    getData();
  }

  getData() async {
    citylist;
    restaurantlist;
  }

  void setupChannel() {
    restaurantstream = StreamController<String>();
    restaurantstream.stream.listen((response) async {
      favresidlist = restaurant.id as List<String>;
      setState(() {});
    });
  }

  @override
  dispose() {
    if (restaurantstream != null && !restaurantstream.isClosed) {
      restaurantstream.sink.close();
      restaurantstream = null;
    }
    if (homestreamdata != null && !homestreamdata.isClosed) homestreamdata.sink.add("");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: ColorsRes.bgcolor,
        elevation: 0,
        centerTitle: true,
        title: CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/title_icon.png",
          width: MediaQuery.of(context).size.width / 2,
        ),
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorsRes.black,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          searchWidget(),
          Expanded(child: restaurantWidget()),
        ]),
      ),
    );
  }

  searchWidget() {
    return Row(
      children: [
        Expanded(
            child: Card(
          color: ColorsRes.lightgrey,
          shape: DesignConfig.setRoundedBorder(ColorsRes.grey, 25, true),
          child: new ListTile(
            leading: searchcontroller.text.trim().isNotEmpty ? null : new Icon(Icons.search),
            title: new TextField(
              autofocus: widget.fromsearch,
              controller: searchcontroller,
              decoration: new InputDecoration(hintText: StringsRes.findrestaurant, border: InputBorder.none),
            ),
            trailing: searchcontroller.text.trim().isEmpty
                ? null
                : IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {
                      searchcontroller.clear();
                    },
                  ),
          ),
        )),
        if (citylist != null && citylist.isNotEmpty)
          EaseInWidget(
              onTap: () {
                cityBottomSheet();
              },
              child: Container(/*width:40,height:40,*/
                //child: Card(
                //shape: DesignConfig.setRoundedBorder(ColorsRes.lightgrey, 10, false),
                //clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Icon(Icons.filter_alt_rounded,color: ColorsRes.appcolor,size: 40,
                  //imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/filter_icon.png",
                  //width: MediaQuery.of(context).size.width / 8,fit: BoxFit.cover,
                  //height: MediaQuery.of(context).size.width / 8,
                ),
                //elevation: 5,
                //),
              ))
      ],
    );
  }

  Widget restaurantWidget() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        itemCount: restaurantlist.length,
        itemBuilder: (context, index) {
          restaurant = restaurantlist[index];
          List<String> descriptionlist = restaurant.description.split(",");
          bool isfav = false;
          String favicon = isfav //restaurant.isbookmarked
              ? "favourite_icon"
              : "favourite_uncheked";
          return GestureDetector(
            onTap: () {
              selectedrestaurant = restaurant;
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => RestaurantDetail(
                        fromfav: false,
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
                    Text("${StringsRes.minorder} : ${Constant.currencysymbol}${restaurant.minimum}"),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Wrap(
                      children: List.generate(
                    descriptionlist.length > 10 ? 10 : descriptionlist.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 3, right: 3, top: 4, bottom: 4),
                      child: Text(
                        descriptionlist[index] + ",",
                        style: Theme.of(context).textTheme.button.merge(TextStyle(color: ColorsRes.grey)),
                      ),
                    ),
                    //  shape: DesignConfig.setRoundedBorder(ColorsRes.lightgrey, 5, false),
                    // )
                  )),
                ),
              ]),
            ),
          );
        });
  }

  cityBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  StringsRes.selectcity,
                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Expanded(
                  child: Stack(
                children: [
                  ListView.builder(
                      padding: EdgeInsets.only(bottom: kToolbarHeight, top: MediaQuery.of(context).padding.top),
                      itemCount: citylist.length,
                      itemBuilder: (context, index) {
                        City city = citylist[index];
                        return ListTile(
                            onTap: () {
                              cityid = city.id.toString();
                              restauranttype = Constant.restaurantCity;
                              print(city.id.toString());
                              setState(() {
                                restaurantlist.clear();
                                restaurantlist.addAll(restaurantlist1.where((element) => element.cityId.toString() == cityid).toList());
                                restaurantlist1;
                                Navigator.pop(context);
                              });
                            },
                            leading: CircleAvatar(
                              backgroundColor: ColorsRes.lightgrey,
                              child: CachedNetworkImage(
                                imageUrl: city.image,
                                height: 100,
                                width: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: Text(city.name),
                            trailing: cityid == city.id.toString()
                                ? Icon(
                                    Icons.check_box,
                                    color: ColorsRes.green,
                                  )
                                : null);
                      }),
                  if (cityid != "0")
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ActionChip(
                          label: Text(
                            StringsRes.lblclear,
                            style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold),
                          ),
                          avatar: Icon(Icons.cancel),
                          shadowColor: ColorsRes.grey,
                          backgroundColor: ColorsRes.IconColor,
                          onPressed: () {
                            cityid = "0";
                            restauranttype = Constant.restaurantAll;
                            restaurantlist;
                            Navigator.of(context).pop();
                            /*  new Future.delayed(new Duration(seconds: 2));
                            //getRestaurantlist();
                               Navigator.of(context).pop();*/
                          },
                        ),
                      ),
                    )
                ],
              )),
            ],
          );
        });
  }
}
