import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';

import 'CustomeButton/WRButton.dart';
import 'CustomeButton/WRButton1.dart';
import 'CustomeButton/WRButton2.dart';

class WRButtonList extends StatefulWidget {
  WRButtonList({Key key}) : super(key: key);

  @override
  _WRButtonListState createState() => _WRButtonListState();
}

class _WRButtonListState extends State<WRButtonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Flutter UI Component",
          )),
      body: ListView(
        shrinkWrap: true,
        children: [
          // WRButton 1 //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), boxShadow: [BoxShadow(color: Color(0x777dedede), blurRadius: 4, spreadRadius: 4)]),
              // margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(
                      //     left: 10, bottom: 8, top: 20, right: 15),
                      child: Text(
                        "WRButton 1",
                        style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 10.0),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 70,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    WRButton1List(),
                  ],
                ),
              ),
            ),
          ),
          // WRButton 2 //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), boxShadow: [BoxShadow(color: Color(0x777dedede), blurRadius: 4, spreadRadius: 4)]),
              // margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(
                      //     left: 10, bottom: 8, top: 20, right: 15),
                      child: Text(
                        "WRButton 2",
                        style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 10.0),
                      child: Container(
                        // margin: const EdgeInsets.only(
                        //   top: 3,
                        //   bottom: 10,
                        // ),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 70,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.width / 4.1,
                      // padding: EdgeInsets.all(15.0),
                      // decoration: BoxDecoration(
                      //   color: Color(0xFFF3E5E5),
                      //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      // ),
                      child: WRButton2List(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // WRButton Shape //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), boxShadow: [BoxShadow(color: Color(0x777dedede), blurRadius: 4, spreadRadius: 4)]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(
                      //     left: 16, bottom: 8, top: 20, right: 15),
                      child: Text(
                        "WRButton Shape",
                        style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                      child: Container(
                        // margin: const EdgeInsets.only(top: 3, bottom: 10, left: 16),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 70,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            // color: Color(0xff5AD2F1).withOpacity(0.50),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    WRBouttonSqure(),
                  ],
                ),
              ),
            ),
          ),

          // WRButton Defalut //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), boxShadow: [BoxShadow(color: Color(0x777dedede), blurRadius: 4, spreadRadius: 4)]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin:
                      //     const EdgeInsets.only(bottom: 8, top: 20, left: 15),
                      child: Text(
                        "WRButton Shape with Border",
                        style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 10.0),
                      child: Container(
                        // margin:
                        //     const EdgeInsets.only(top: 3, bottom: 10, left: 16),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 70,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            // color: Color(0xff5AD2F1).withOpacity(0.50),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    WRBouttonDefalut(),
                  ],
                ),
              ),
            ),
          ),

          // WRButton Disable //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10.0)), boxShadow: [BoxShadow(color: Color(0x777dedede), blurRadius: 4, spreadRadius: 4)]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.only(
                      //     left: 16, bottom: 8, top: 20, right: 15),
                      child: Text(
                        "WRButton Disable",
                        style: TextStyle(fontSize: 20.0, color: Color(0xff5AD2F1), fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0, bottom: 10.0),
                      child: Container(
                        // margin:
                        //     const EdgeInsets.only(top: 3, bottom: 10, left: 16),
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: 70,
                          height: 3,
                          decoration: BoxDecoration(
                            color: Colors.pink[200],
                            // color: Color(0xff5AD2F1).withOpacity(0.50),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    WRBouttonDisable(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WRBouttonDisable extends StatelessWidget {
  const WRBouttonDisable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WRButton(
          onTap: () {},
          color: Colors.deepPurpleAccent,
          width: MediaQuery.of(context).size.width / 4,
          height: 50.0,
          disable: true,
          shape: WRShape.squre,
          text: "SQURE",
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          textcolor: Colors.white,
        ),
        WRButton(onTap: () {}, color: Colors.pinkAccent, width: MediaQuery.of(context).size.width / 4, height: 50.0, disable: true, shape: WRShape.defalut, text: "DEFALUT", fontWeight: FontWeight.bold, fontSize: 16.0, textcolor: Colors.white),
        WRButton(
          onTap: () {},
          color: Colors.greenAccent[400],
          width: MediaQuery.of(context).size.width / 4,
          height: 50.0,
          disable: true,
          shape: WRShape.rounded,
          text: "ROUNDED",
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          textcolor: Colors.white,
        ),
      ],
    );
  }
}

class WRBouttonDefalut extends StatelessWidget {
  const WRBouttonDefalut({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WRButton(
          onTap: () {},
          color: Colors.deepPurpleAccent,
          width: MediaQuery.of(context).size.width / 4,
          height: 50.0,
          shape: WRShape.squre,
          border: true,
          text: "SQURE",
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          textcolor: Colors.deepPurpleAccent,
        ),
        WRButton(onTap: () {}, color: Colors.pinkAccent, width: MediaQuery.of(context).size.width / 4, height: 50.0, shape: WRShape.defalut, border: true, text: "DEFALUT", fontWeight: FontWeight.bold, fontSize: 16.0, textcolor: Colors.pinkAccent),
        WRButton(
          onTap: () {},
          color: Colors.greenAccent[400],
          width: MediaQuery.of(context).size.width / 4,
          height: 50.0,
          shape: WRShape.rounded,
          border: true,
          text: "ROUNDED",
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          textcolor: Colors.greenAccent[400],
        ),
      ],
    );
  }
}

class WRBouttonSqure extends StatelessWidget {
  const WRBouttonSqure({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WRButton(
          onTap: () {},
          color: Colors.deepPurpleAccent,
          width: MediaQuery.of(context).size.width / 4,
          height: 50.0,
          shape: WRShape.squre,
          text: "SQURE",
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          textcolor: Colors.white,
        ),
        WRButton(
          onTap: () {},
          color: Colors.pinkAccent,
          width: MediaQuery.of(context).size.width / 4,
          height: 50.0,
          shape: WRShape.defalut,
          text: "DEFALUT",
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          textcolor: Colors.white,
        ),
        WRButton(
          onTap: () {},
          color: Colors.greenAccent[400],
          width: MediaQuery.of(context).size.width / 4,
          height: 50.0,
          shape: WRShape.rounded,
          text: "ROUNDED",
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          textcolor: Colors.white,
        ),
      ],
    );
  }
}

class WRButton1List extends StatelessWidget {
  const WRButton1List({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WRButton1(
          width: MediaQuery.of(context).size.width / 4.5,
          height: 50.0,
          padding: 10.0,
          tlbr: true,
          bgcolor: Color(0xff37ad95),
          text: Text(
            "SEARCH",
            style: TextStyle(
                // fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          icon: Icon(
            Icons.search,
            color: Color(0xff37ad95),
          ),
          iconbgcolor: Colors.white,
        ),
        // SizedBox(
        //   width: 35.0,
        // ),
        WRButton1(
          width: MediaQuery.of(context).size.width / 4.5,
          height: 50.0,
          padding: 10.0,
          bgcolor: Colors.white,
          text: Text(
            "LOGIN",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff37ad95)),
          ),
          icon: Icon(Icons.login, color: Colors.white),
          iconbgcolor: Color(0xff37ad95),
        ),
      ],
    );
  }
}

class WRButton2List extends StatelessWidget {
  const WRButton2List({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        WRButton2(
          roundCorner: true,
          width: MediaQuery.of(context).size.width / 2.6,
          height: 50.0,
          bgcolor: Color(0xff37ad95),
          text: Text(
            "MORE",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xff37ad95)),
          ),
          icon: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
          iconbgcolor: Colors.white,
        ),
        SizedBox(
          width: 15.0,
        ),
        WRButton2(
          width: MediaQuery.of(context).size.width / 2.6,
          height: 50.0,
          bgcolor: Colors.white,
          text: Text(
            "LOGIN",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          icon: Icon(Icons.login, color: Color(0xff37ad95)),
          iconbgcolor: Color(0xff37ad95),
        ),
      ],
    );
  }
}
