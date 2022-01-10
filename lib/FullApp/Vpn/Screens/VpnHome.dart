import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/Screens/VpnSubscriptionDetail.dart';
import 'package:smartkit/FullApp/Vpn/widget/customDivider.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'VpnKillSwitch.dart';
import 'VpnSelectVpn.dart';
import 'VpnsharePage.dart';
import 'aboutScreen.dart';

class VpnHome extends StatefulWidget {
  VpnHome({Key key}) : super(key: key);

  @override
  _VpnHomeState createState() => _VpnHomeState();
}

class _VpnHomeState extends State<VpnHome> with TickerProviderStateMixin {
  AnimationController rotateController, helmController;
  Animation<double> helmAnimation;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey currentLocationButtonKey = GlobalKey();
  GlobalKey connectButtonKey = GlobalKey();
  GlobalKey drawerButtonKey = GlobalKey();
  bool isclicked = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: vpn11,
        drawer: Drawer(
          child: Container(
            child: Material(
              color: Color(0xffeff6ff),
              child: _drawerWidget(context),
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          elevation: 3,
          flexibleSpace: Container(
            width: double.infinity,
            decoration: vpngradient_box,
          ),
          centerTitle: true,
          title: Text("LIGHT VPN", style: TextStyle(color: Colors.white)),
          leading: IconButton(
            icon: CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/drawer.png",
              height: 20,
              width: 20,
            ),
            onPressed: () => scaffoldKey.currentState.openDrawer(),
          ),
        ),
        bottomNavigationBar: vpnSetBottomNavigation(0, context, false),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => VpnSubscriptionDetail()));
                },
                child: Container(
                  decoration: vpncirculargradient_box,
                  margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.network(
                        "https://smartkit.wrteam.in/smartkit/vpn/sel_premium.svg",
                        height: 20,
                        width: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Go Premium",
                        style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: _body(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          children: [
            Center(child: _connectButtonWidget()),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Status : ",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 0.5, color: vpn22, fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      isclicked == true ? "Connected" : "Not Connected",
                      //textAlign: TextAlign.center,
                      //style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: value.isConnected ? DesignConfig.green : DesignConfig.pink,fontWeight: FontWeight.w500)),
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: isclicked == true ? Colors.greenAccent[400] : Colors.redAccent[400], fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
//                 }),
              ),
            ),
          ],
        ),
        ColumnDivider(space: 20),
        _currentLocationWidget(),
        ColumnDivider(space: 10),
      ],
    );
  }

  Widget _currentLocationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextButton(
        key: currentLocationButtonKey,
        style: TextButton.styleFrom(
          primary: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: vpn77)),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/canada.png",
              height: 40,
              width: 40,
            ),
            RowDivider(),
            Expanded(
                child: Text(
              "Canada",
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
            )),
            RowDivider(),
            Icon(
              LineIcons.angleRight,
              color: Colors.black,
            ),
          ],
        ),
        onPressed: () {
          _changeLocationClick(false);
        },
      ),
    );
  }

  void _changeLocationClick(bool isfinish) async {
    if (isfinish) Navigator.of(context).pop();
    await Navigator.push(context, MaterialPageRoute(builder: (context) => VpnSelectVpn()));
  }

  Widget _connectButtonWidget() {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: SvgPicture.network(
          isclicked != true ? "https://smartkit.wrteam.in/smartkit/vpn/connect.svg" : "https://smartkit.wrteam.in/smartkit/vpn/disconnect.svg",
          width: 160.0,
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {
        if (isclicked == true) {
          setState(() {
            isclicked = false;
          });
        } else {
          setState(() {
            isclicked = true;
          });
        }
      },
    );
  }

  Widget _drawerWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          alignment: Alignment.center,
          decoration: vpngradient_box,
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                "assets/lightvpn.svg",
                color: Colors.white,
                width: 30.0,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              "LIGHT VPN",
              style: Theme.of(context).textTheme.headline5.merge(TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
            )
          ]),
        ),
        ListTile(
          dense: true,
          leading: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/dra_locations.png"),
          title: Text(
            "Choose Server",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => VpnSelectVpn()));
          },
        ),
        ListTile(
          leading: Icon(LineIcons.wrench, color: Colors.black),
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => VpnKillSwitch()));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            children: [
              Text("About", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77))),
              // RowDivider(),
              Expanded(
                child: Divider(),
              )
            ],
          ),
        ),
        ListTile(
          dense: true,
          title: Text(
            "Privacy Policy",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
          ),
          leading: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/dra_pricacypolicy.png"),
          //leading: Icon(LineIcons.shield, color: Colors.black),
          // onTap: () => _privacyPolicyClick(context),
        ),
        ListTile(
          dense: true,
          title: Text(
            "Terms of Services",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
          ),
          leading: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/dra_termscondi.png"),
          //leading: Icon(LineIcons.sticky_note, color: Colors.black),
          // onTap: _tosClick,
        ),
        ListTile(
          dense: true,
          title: Text(
            "About",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
          ),
          leading: Icon(LineIcons.infoCircle, color: Colors.black),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen()));
          },
        ),
        ListTile(
          dense: true,
          title: Text(
            "Rate Us",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
          ),
          leading: Icon(LineIcons.starAlt, color: Colors.black),
          // onTap: _rateUsClick,
        ),
        ListTile(
          dense: true,
          title: Text(
            "Share App",
            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
          ),
          leading: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/dra_share.png"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => VpnSharePage()));
          },
        ),
      ],
    );
  }
}
