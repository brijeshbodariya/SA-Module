import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/desktop/Screens/VpnHomeDesktop.dart';
import 'package:smartkit/FullApp/Vpn/widget/customDivider.dart';

class VpnSubscriptionDetailDesktop extends StatefulWidget {
  VpnSubscriptionDetailDesktop({Key key}) : super(key: key);

  @override
  _VpnSubscriptionDetailStateDesktop createState() => _VpnSubscriptionDetailStateDesktop();
}

class _VpnSubscriptionDetailStateDesktop extends State<VpnSubscriptionDetailDesktop> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = TextButton.styleFrom(
      primary: vpn77.withOpacity(0.5),
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 25,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: vpn77.withOpacity(0.5))),
    );
    return Scaffold(
      backgroundColor: vpn11,
      appBar: vpnSetAppbar("Premium"),
      bottomNavigationBar: vpnSetBottomNavigation(3, context, false),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 600,
            width: 700,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
                    children: [
                      Text(
                        "Open All Video Sites",
                        style: Theme.of(context).textTheme.headline5.merge(TextStyle(
                              fontWeight: FontWeight.bold,
                              color: vpn22,
                            )),
                      ),
                      ColumnDivider(space: 10),
                      TextButton(
                        style: outlineButtonStyle,
                        onPressed: () {},
                        child: _stars("10x Faster Speed"),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        style: outlineButtonStyle,
                        child: _stars("Stream anytime and anywhere"),
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        style: outlineButtonStyle,
                        onPressed: () {},
                        child: _stars("HD Quality"),
                      ),
                      SizedBox(height: 20),
                      TextButton(
                        style: outlineButtonStyle,
                        child: _stars("Unblock All Videos"),
                        onPressed: () {},
                      ),
                      ColumnDivider(space: 30),
                      Text(
                        "This subscription gives you unlimited access to all app features. If you don't cancel before trial ends, you will be charged the amount chosen above until you cancel",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VpnHomeDesktop()));
                  },
                  child: Container(
                    decoration: vpncirculargradient_box,
                    margin: EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                        child: Text(
                      "Subscribe",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.white)),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _stars(String title) {
    return Row(
      children: [
        CachedNetworkImage(
          imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/star.png",
          width: 18,
          height: 18,
          color: vpn22,
        ),
        RowDivider(),
        Text(
          "$title",
          style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: vpn77)),
        )
      ],
    );
  }
}
