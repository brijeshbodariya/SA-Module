import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/StringsRes.dart';

class ChangePasswordDesktop extends StatefulWidget {
  @override
  _ChangePasswordStateDesktop createState() => _ChangePasswordStateDesktop();
}

class _ChangePasswordStateDesktop extends State<ChangePasswordDesktop> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool iserrorold = false;
  TextEditingController oldpsw, newpsw, cpsw;
  String cpswerrtext;
  bool _obscureTextold = true, _obscureTextnew = true, _obscureTextcm = true;

  @override
  void initState() {
    super.initState();
    oldpsw = new TextEditingController();
    newpsw = new TextEditingController();
    cpsw = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ColorsRes.white,
        body: Center(
          child: SizedBox(
            height: 600,
            width: 550,
            child: Container(
              color: Color(0xFFF8F8F8),
              child: Stack(children: [
                CachedNetworkImage(
                  imageUrl: 'https://smartkit.wrteam.in/smartkit/foodmaster/login_bg.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Column(children: [
                  /*Padding(
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
                  ),*/
                  Expanded(child: changePswWidget()),
                ])
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget changePswWidget() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: kToolbarHeight, left: 20, right: 20),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        Text(
          "${StringsRes.lblchangepassword}",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 15),
        Text(
          StringsRes.enteroldpassword,
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
          child: TextField(
            obscureText: _obscureTextold,
            controller: oldpsw,
            decoration: InputDecoration(
              hintText: "Enter Old Password",
              errorText: iserrorold ? 'Enter Old Password' : null,
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureTextold = !_obscureTextold;
                  });
                },
                child: Icon(
                  _obscureTextold ? Icons.visibility : Icons.visibility_off,
                  color: ColorsRes.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          StringsRes.enternewpassword,
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
          child: TextField(
            obscureText: _obscureTextnew,
            controller: newpsw,
            decoration: InputDecoration(
              hintText: "${StringsRes.enternewpassword}",
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureTextnew = !_obscureTextnew;
                  });
                },
                child: Icon(
                  _obscureTextnew ? Icons.visibility : Icons.visibility_off,
                  color: ColorsRes.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15),
        Text(
          StringsRes.enterconfirmpassword,
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
          child: TextField(
            obscureText: _obscureTextcm,
            controller: cpsw,
            decoration: InputDecoration(
              hintText: "${StringsRes.enterconfirmpassword}",
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureTextcm = !_obscureTextcm;
                  });
                },
                child: Icon(
                  _obscureTextcm ? Icons.visibility : Icons.visibility_off,
                  color: ColorsRes.grey,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),
        Center(
          child: new FlatButton(
            shape: DesignConfig.setRoundedBorder(ColorsRes.appcolor, 20, false),
            padding: EdgeInsets.only(left: 70, right: 70, top: 13, bottom: 16),
            textColor: ColorsRes.white,
            color: ColorsRes.appcolor,
            child: new Text(
              "${StringsRes.change}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () async {
              setState(() {});
              scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Change password Sucessfull")));
            },
          ),
        )
      ]),
    );
  }
}
