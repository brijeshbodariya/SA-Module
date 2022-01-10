import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class SimNavListDrawer extends StatefulWidget {
  @override
  _SimNavListDrawerState createState() => _SimNavListDrawerState();
}

class _SimNavListDrawerState extends State<SimNavListDrawer> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Simple Nav Drawer",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: Center(child: Text("Simple Navigation Drawer")),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new ListTile(
                leading: Icon(Icons.library_music, color: happyshopcolor2),
                title: new Text("Music"),
                trailing: Icon(
                  Icons.navigate_next,
                  color: happyshopcolor2,
                ),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Music Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
            new ListTile(
                leading: Icon(Icons.movie, color: happyshopcolor3),
                trailing: Icon(
                  Icons.navigate_next,
                  color: happyshopcolor3,
                ),
                title: new Text("Movies"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Movies Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
            new ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: cryptocolor2,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: cryptocolor2,
                ),
                title: new Text("Shopping"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Shopping Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
            new ListTile(
                leading: Icon(
                  Icons.apps,
                  color: cryptocolor3,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: cryptocolor3,
                ),
                title: new Text("Apps"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Apps Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
            new ListTile(
                leading: Icon(
                  Icons.dashboard,
                  color: bookKing2,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: bookKing2,
                ),
                title: new Text("Docs"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Docs Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
            new ListTile(
                leading: Icon(
                  Icons.settings,
                  color: bookKing3,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: bookKing3,
                ),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Settings Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
            new ListTile(
                leading: Icon(
                  Icons.info,
                  color: smartkey2,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: smartkey2,
                ),
                title: new Text("About"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("About Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
            new ListTile(
                leading: Icon(
                  Icons.power_settings_new,
                  color: smartkey3,
                ),
                trailing: Icon(
                  Icons.navigate_next,
                  color: smartkey3,
                ),
                title: new Text("Logout"),
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Logout Clicked!"),
                    duration: Duration(seconds: 2),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
