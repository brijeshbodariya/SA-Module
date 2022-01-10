import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/Screens/VpnHome.dart';
import 'package:smartkit/FullApp/Vpn/widget/customDivider.dart';

class VpnSubscriptionDetail extends StatefulWidget {
  VpnSubscriptionDetail({Key key}) : super(key: key);

  @override
  _VpnSubscriptionDetailState createState() => _VpnSubscriptionDetailState();
}

class _VpnSubscriptionDetailState extends State<VpnSubscriptionDetail> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle outlineButtonStyle = TextButton.styleFrom(
      primary: vpn77.withOpacity(0.5),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8), side: BorderSide(color: vpn77.withOpacity(0.5))),
    );
    return Scaffold(
      backgroundColor: vpn11,
      appBar: vpnSetAppbar("Premium"),
      bottomNavigationBar: vpnSetBottomNavigation(3, context, false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [vpn22, vpn33],
                      ).createShader(bounds);
                    },
                    child: Text(
                      "Open All Video Sites",
                      style: Theme.of(context).textTheme.headline6.merge(TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  ColumnDivider(space: 10),
                  TextButton(
                    style: outlineButtonStyle,
                    onPressed: () {},
                    child: _stars("10x Faster Speed"),
                  ),
                  TextButton(
                    style: outlineButtonStyle,
                    child: _stars("Stream anytime and anywhere"),
                    onPressed: () {},
                  ),
                  TextButton(
                    style: outlineButtonStyle,
                    onPressed: () {},
                    child: _stars("HD Quality"),
                  ),
                  TextButton(
                    style: outlineButtonStyle,
                    child: _stars("Unblock All Videos"),
                    onPressed: () {},
                  ),
                  ColumnDivider(space: 30),
                  Text(
                    "This subscription gives you unlimited access to all app features. If you don't cancel before trial ends, you will be charged the amount chosen above until you cancel",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VpnHome()));
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
