import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/HappyShop/Helper/HappyShopColor.dart';
import '../Tab/first.dart';
import '../Tab/second.dart';
import '../Tab/third.dart';

class Sim_Icon extends StatefulWidget {
  @override
  Sim_IconState createState() => new Sim_IconState();
}

// SingleTickerProviderStateMixin is used for animation
class Sim_IconState extends State<Sim_Icon> with SingleTickerProviderStateMixin {
  /*
   *-------------------- Setup Tabs ------------------*
   */
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      unselectedLabelColor: smartkey2,
      labelColor: happyshopcolor2,
      indicatorColor: happyshopcolor2,
      tabs: <Tab>[
        new Tab(
          // set icon to the tab
          //text:"Favourite",
          icon: new Icon(Icons.favorite),
        ),
        new Tab(
          // text:"Profile",
          icon: new Icon(Icons.person),
        ),
        new Tab(
          //text: "Search",
          icon: new Icon(Icons.search),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  /*
   *-------------------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // Appbar
        appBar: new AppBar(
            // Title
            title: new Text("Using Tabs",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
            color: Colors.black
        ),
            // Set the background color of the App Bar
            // backgroundColor: Colors.blue,
            // Set the bottom property of the Appbar to include a Tab Bar
            bottom: getTabBar()),
        // Set the TabBar view as the body of the Scaffold
        body: getTabBarView(<Widget>[new FirstTab(), new SecondTab(), new ThirdTab()]));
  }
}
