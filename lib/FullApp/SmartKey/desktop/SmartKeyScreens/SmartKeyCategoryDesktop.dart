import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeyHomeDesktop.dart';
import 'package:smartkit/FullApp/SmartKey/desktop/SmartKeyScreens/SmartKeySubCategoryDesktop.dart';

class SmartKeyCategoryDesktop extends StatefulWidget {
  SmartKeyCategoryDesktop({Key key}) : super(key: key);

  @override
  _SmartKeyCategoryDesktopState createState() =>
      _SmartKeyCategoryDesktopState();
}

class _SmartKeyCategoryDesktopState extends State<SmartKeyCategoryDesktop> {
  @override
  Widget build(BuildContext context) {
    List catList = [
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
      {'img': "assets/smartkey.svg", 'title': "demo"},
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
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
                          builder: (context) => SmartKeySubCategoryDesktop(),
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
            builder: (context) => SmartKeyHomeDesktop(),
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
          body: Center(
            child: Container(
              /*decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),*/
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.width / 2.5,
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: catList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return listLitem(index);
                  }),
            ),
          )),
    );
  }
}
