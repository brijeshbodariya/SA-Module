import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class NavDrawerIconic extends StatefulWidget {
  @override
  _NavDrawerIconicState createState() => _NavDrawerIconicState();
}

class _NavDrawerIconicState extends State<NavDrawerIconic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nav Drawer",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: Center(child: Text("Navigation Drawer Iconic")),
      drawer: new Container(
        constraints: new BoxConstraints.expand(
          width: 80,
        ),
        color: Colors.white,
        alignment: Alignment.center,
        child: new ListView(
          children: <Widget>[
            new SizedBox(
                height: 80,
                width: 80,
                child: new DrawerHeader(
                  child: CircleAvatar(radius: 40, backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/46.jpg")),
                )),
            new ListTile(
                leading: Icon(
                  Icons.library_music,
                  size: 40,
                  color: happyshopcolor2,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(
                  Icons.movie,
                  size: 40,
                  color: happyshopcolor3,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  size: 40,
                  color: cryptocolor2,
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.apps, size: 40, color: cryptocolor3),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.dashboard, size: 40, color: bookKing2),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.settings, size: 40, color: bookKing3),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.info, size: 40, color: smartkey2),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new, size: 40, color: smartkey3),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
