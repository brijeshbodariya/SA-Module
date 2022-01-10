import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ButtonTextFieldShapActivity extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ButtonTextFieldShapActivityState();
  }
}

class ButtonTextFieldShapActivityState extends State<ButtonTextFieldShapActivity> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Button And TextField Shape",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      resizeToAvoidBottomInset: false,
      body: ScreenTypeLayout(
        mobile: AppWidget(),
        tablet: AppWidget(),
        desktop: WebWidget(),
      ),
    );
  }
}

Widget AppWidget(){
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height:10),
        Container(padding: EdgeInsets.all(20),margin: EdgeInsets.only(left: 50, right: 50),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Color(0xff003f5c), width: 1)),
            child: Align(
              alignment: Alignment.center,
              child: Text("Hello", style: TextStyle(color: Color(0xff003f5c)),
              ),
            )),
        SizedBox(height: 20),
        Container(padding: EdgeInsets.all(20),margin: EdgeInsets.only(left: 50, right: 50),
          decoration: BoxDecoration(color: Color(0xffbc5090),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Color(0xffbc5090), width: 1)),
          child: Align(
            alignment: Alignment.center,
            child: Text("Add",style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(height: 20),
        Container(
          //padding: EdgeInsets.only(left: 65),
          margin: EdgeInsets.only(left: 50, right: 50),
          alignment: Alignment.center,
          height: 65,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffbc5090),
              Color(0xff58508d),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(10),
          ),
          child:
          Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),),
        SizedBox(height: 20),
        Container(
          //padding: EdgeInsets.only(left: 65),
          margin: EdgeInsets.only(left: 50, right: 50),
          alignment: Alignment.center,
          height: 65,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffbc5090),
              Color(0xff58508d),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50.0),
              bottomRight: Radius.circular(50.0),
            ),
          ),
          child:
          Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),),
        SizedBox(height: 20),
        Container(width: 70,
          //padding: EdgeInsets.only(left: 65),
          margin: EdgeInsets.only(left: 50, right: 50),
          alignment: Alignment.center,
          height: 65,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xffbc5090),
              Color(0xff58508d),
            ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child:
          Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),),
        SizedBox(height: 20),
        Container(margin: EdgeInsets.only(left: 50, right: 50),padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Color(0xff003f5c), width: 1)),
            child: Align(
              alignment: Alignment.center,
              child: TextField(decoration: InputDecoration(hintText: "Enter Name",border: InputBorder.none), style: TextStyle(color: Color(0xff003f5c)),
              ),
            )),
        SizedBox(height: 20),
        Container(margin: EdgeInsets.only(left: 50, right: 50),padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            height: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffbc5090),
                Color(0xffbc5090),
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextField(decoration: InputDecoration(hintText: "Enter Name",border: InputBorder.none,hintStyle: TextStyle(color: Colors.white)), style: TextStyle(color: Colors.white))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Card(color: Colors.white38,
              margin: new EdgeInsets.only(
                  left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 2,
              child: new Padding(
                padding: new EdgeInsets.all(25.0),
                child: new Column(
                  children: <Widget>[
                    Container(padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Color(0xff003f5c), width: 1)),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextField(decoration: InputDecoration(hintText: "Enter Name",border: InputBorder.none), style: TextStyle(color: Color(0xff003f5c)),
                          ),
                        )),
                    new Padding(padding: new EdgeInsets.only(top: 30.0)),
                    Container(padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Color(0xffbc5090),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Color(0xffbc5090), width: 1)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Add",style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget WebWidget(){
  return SingleChildScrollView(
    child: Center(
      child: SizedBox(width: 500,
        child: Column(
          children: [
            SizedBox(height:10),
            Container(padding: EdgeInsets.all(20),margin: EdgeInsets.only(left: 50, right: 50),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Color(0xff003f5c), width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Hello", style: TextStyle(color: Color(0xff003f5c)),
                  ),
                )),
            SizedBox(height: 20),
            Container(padding: EdgeInsets.all(20),margin: EdgeInsets.only(left: 50, right: 50),
              decoration: BoxDecoration(color: Color(0xffbc5090),
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Color(0xffbc5090), width: 1)),
              child: Align(
                alignment: Alignment.center,
                child: Text("Add",style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            Container(
              //padding: EdgeInsets.only(left: 65),
              margin: EdgeInsets.only(left: 50, right: 50),
              alignment: Alignment.center,
              height: 65,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffbc5090),
                  Color(0xff58508d),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
              Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),),
            SizedBox(height: 20),
            Container(
              //padding: EdgeInsets.only(left: 65),
              margin: EdgeInsets.only(left: 50, right: 50),
              alignment: Alignment.center,
              height: 65,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffbc5090),
                  Color(0xff58508d),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),
                ),
              ),
              child:
              Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),),
            SizedBox(height: 20),
            Container(width: 70,
              //padding: EdgeInsets.only(left: 65),
              margin: EdgeInsets.only(left: 50, right: 50),
              alignment: Alignment.center,
              height: 65,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xffbc5090),
                  Color(0xff58508d),
                ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child:
              Text(
                "Ok",
                style: TextStyle(color: Colors.white, fontSize: 20),textAlign: TextAlign.center,),),
            SizedBox(height: 20),
            Container(margin: EdgeInsets.only(left: 50, right: 50),padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff003f5c), width: 1)),
                child: Align(
                  alignment: Alignment.center,
                  child: TextField(decoration: InputDecoration(hintText: "Enter Name",border: InputBorder.none), style: TextStyle(color: Color(0xff003f5c)),
                  ),
                )),
            SizedBox(height: 20),
            Container(margin: EdgeInsets.only(left: 50, right: 50),padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 65,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xffbc5090),
                    Color(0xffbc5090),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: TextField(decoration: InputDecoration(hintText: "Enter Name",border: InputBorder.none,hintStyle: TextStyle(color: Colors.white)), style: TextStyle(color: Colors.white))),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Card(color: Colors.white38,
                  margin: new EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  elevation: 2,
                  child: new Padding(
                    padding: new EdgeInsets.all(25.0),
                    child: new Column(
                      children: <Widget>[
                        Container(padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff003f5c), width: 1)),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextField(decoration: InputDecoration(hintText: "Enter Name",border: InputBorder.none), style: TextStyle(color: Color(0xff003f5c)),
                              ),
                            )),
                        new Padding(padding: new EdgeInsets.only(top: 30.0)),
                        Container(padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(color: Color(0xffbc5090),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Color(0xffbc5090), width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Add",style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
