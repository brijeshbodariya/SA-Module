import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';

import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/profile/ChangePasswordMobile.dart';

import '../MainHomePageMobile.dart';

class UserInfoPageMobile extends StatefulWidget {
  @override
  _UserInfoPageStateMobile createState() => _UserInfoPageStateMobile();
}

class _UserInfoPageStateMobile extends State<UserInfoPageMobile> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController edtemail = new TextEditingController();

  TextEditingController edtname = new TextEditingController();

  TextEditingController edtphone = new TextEditingController();

  bool isloading = false;
  final _formKey = GlobalKey<FormState>();

  Future<bool> _backPress() {
    return new Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _backPress,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorsRes.bgcolor,
          body: Stack(
            children: [
              CachedNetworkImage(
                imageUrl: 'https://smartkit.wrteam.in/smartkit/foodmaster/shape_profile.png',
                fit: BoxFit.fill,
              ),
              Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 15, left: 15, right: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Card(
                        shape: DesignConfig.setRoundedBorder(ColorsRes.white, 8, false),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: ColorsRes.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CircleAvatar(radius: 55, backgroundColor: ColorsRes.white, child: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/profile_image.png")),
                ),
                Text(
                  "Ankita",
                  style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringsRes.lblemail,
                              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: ColorsRes.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorsRes.grey.withOpacity(0.1),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: TextFormField(
                                controller: edtemail,
                                enabled: false,
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.lblemail,
                                  hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              StringsRes.lblname,
                              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: ColorsRes.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorsRes.grey.withOpacity(0.1),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: TextFormField(
                                controller: edtname,
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.lblname,
                                  hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              StringsRes.lblmobileno,
                              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey)),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 3),
                              padding: EdgeInsets.only(top: 3, bottom: 3, left: 10, right: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: ColorsRes.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: ColorsRes.grey.withOpacity(0.1),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: TextFormField(
                                controller: edtphone,
                                style: TextStyle(color: ColorsRes.black),
                                cursorColor: ColorsRes.black,
                                decoration: InputDecoration(
                                  hintText: StringsRes.lblmobileno,
                                  hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            GestureDetector(
                              onTap: () async {
                                Navigator.of(context).pushAndRemoveUntil(
                                    CupertinoPageRoute(
                                        builder: (context) => MainHomePageMobile(
                                              from: "pagefrom",
                                            )),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                                child: DesignConfig.shadowButtonFullwidgth(ColorsRes.appcolor, StringsRes.lblupdate.toUpperCase(), ColorsRes.white, 20, ColorsRes.white, context),
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ChangePasswordMobile()));
                                },
                                child: Text(
                                  StringsRes.lblchangepassword,
                                  style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(decoration: TextDecoration.underline)),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ]),
            ],
          ),
        ));
  }
}
