import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';

class NavProfileDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavProfileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nav Drawer",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),

      body: Center(child: Text("Navigation Drawer With Profile")),
      // body:Text("Navigation Drawer With Profile",style: TextStyle(),),
      drawer: new Drawer(
        child: SingleChildScrollView(
          child: new Column(
            children: [
              new UserAccountsDrawerHeader(
                accountName: new Text("Abc Kumar"),
                accountEmail: new Text("abc23@gmail.com"),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new CachedNetworkImageProvider('https://smartkit.wrteam.in/smartkit/images/drawer.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage("https://randomuser.me/api/portraits/men/46.jpg")),
              ),
              new ListTile(
                  leading: Icon(Icons.library_music, color: happyshopcolor2),
                  title: new Text("Music"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              new ListTile(
                  leading: Icon(Icons.movie, color: happyshopcolor3),
                  title: new Text("Movies"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              new ListTile(
                  leading: Icon(Icons.shopping_cart, color: cryptocolor2),
                  title: new Text("Shopping"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              new Divider(),
              new ListTile(
                  leading: Icon(Icons.apps, color: cryptocolor3),
                  title: new Text("Apps"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              new ListTile(
                  leading: Icon(Icons.dashboard, color: bookKing2),
                  title: new Text("Docs"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              new Divider(),
              new ListTile(
                  leading: Icon(Icons.settings, color: bookKing3),
                  title: new Text("Settings"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              new ListTile(
                  leading: Icon(Icons.info, color: smartkey2),
                  title: new Text("About"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              new ListTile(
                  leading: Icon(Icons.power_settings_new, color: smartkey3),
                  title: new Text("Logout"),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
