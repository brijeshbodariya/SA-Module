import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/tablet/SmartKeyScreens/SmartKeyHomeTablet.dart';
import 'package:smartkit/FullApp/SmartKey/tablet/SmartKeyScreens/SmartKeySubCategoryTablet.dart';

class SmartKeyCategoryTablet extends StatefulWidget {
  SmartKeyCategoryTablet({Key key}) : super(key: key);

  @override
  _SmartKeyCategoryTabletState createState() => _SmartKeyCategoryTabletState();
}

class _SmartKeyCategoryTabletState extends State<SmartKeyCategoryTablet> {
  @override
  Widget build(BuildContext context) {
    List catList = [
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"}
    ];

    Widget listLitem(int index) {
      return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            child: Material(
                borderRadius: BorderRadius.circular(20.0),
                //color:primary,
                child: InkWell(
                    splashColor: smartkey2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset(
                            "assets/smartkey.svg",
                            width: 40,
                            height: 40,
                          ),
                          Expanded(
                            child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  catList[index]['title'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SmartKeySubCategoryTablet(),
                        ),
                      );
                    })),
            elevation: 5,
          ));
    }

    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SmartKeyHomeTablet(),
          ),
        );
      },
      child: Scaffold(
          backgroundColor: smartkey2,
          appBar: AppBar(
            title: Container(child: Text("Select Category")),
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: smartkeygradient),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: catList.length,
                itemBuilder: (BuildContext context, int index) {
                  return listLitem(index);
                }),
          )),
    );
  }
}
