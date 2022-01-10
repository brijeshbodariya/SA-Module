import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class SimNavDrawer extends StatefulWidget {
  @override
  _SimNavDrawerState createState() => _SimNavDrawerState();
}

class _SimNavDrawerState extends State<SimNavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(
          color: Colors.black
      ),backgroundColor: Colors.white,title: Text("Simple Nav Drawer",style: TextStyle(color: Colors.black),)),

      body: Center(child: Text("Simple Navigation Drawer")),
      // body:Text("Navigation Drawer With Profile",style: TextStyle(),),
      drawer: new Drawer(
        child: SingleChildScrollView(
          child: new Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(gradient: happyshopgradient),
                child: new Container(
                  // width: 80.0,
                  // height: 150.0,

                  // color: Colors.blue,
                  child: Center(
                    child: Container(width: 70.0, height: 70.0, decoration: new BoxDecoration(image: new DecorationImage(fit: BoxFit.fill, image: new CachedNetworkImageProvider('https://smartkit.wrteam.in/smartkit/images/logo.png')))),
                  ),
                ),
              ),
              Column(
                children: [
                  new ListTile(
                      leading: Icon(
                        Icons.library_music,
                        color: happyshopcolor2,
                      ),
                      title: new Text("Music", style: TextStyle(color: happyshopcolor2)),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: happyshopcolor2,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  new ListTile(
                      leading: Icon(Icons.movie, color: happyshopcolor3),
                      trailing: Icon(Icons.navigate_next, color: happyshopcolor3),
                      title: new Text("Movies", style: TextStyle(color: happyshopcolor3)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  new ListTile(
                      leading: Icon(Icons.shopping_cart, color: cryptocolor2),
                      trailing: Icon(Icons.navigate_next, color: cryptocolor2),
                      title: new Text("Shopping", style: TextStyle(color: cryptocolor2)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  new ListTile(
                      leading: Icon(Icons.apps, color: cryptocolor3),
                      trailing: Icon(Icons.navigate_next, color: cryptocolor3),
                      title: new Text("Apps", style: TextStyle(color: cryptocolor3)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  new ListTile(
                      leading: Icon(Icons.dashboard, color: bookKing2),
                      trailing: Icon(Icons.navigate_next, color: bookKing2),
                      title: new Text("Docs", style: TextStyle(color: bookKing2)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  new ListTile(
                      leading: Icon(Icons.settings, color: bookKing3),
                      trailing: Icon(Icons.navigate_next, color: bookKing3),
                      title: new Text("Settings", style: TextStyle(color: bookKing3)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  new ListTile(
                      leading: Icon(Icons.info, color: smartkey2),
                      trailing: Icon(Icons.navigate_next, color: smartkey2),
                      title: new Text("About", style: TextStyle(color: smartkey2)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                  new ListTile(
                      leading: Icon(Icons.power_settings_new, color: smartkey3),
                      trailing: Icon(Icons.navigate_next, color: smartkey3),
                      title: new Text("Logout", style: TextStyle(color: smartkey3)),
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
