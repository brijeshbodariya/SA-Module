import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/widget/customDivider.dart';

class AboutScreenTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vpn11,
      appBar: vpnSetAppbar("About"),
      body: Center(
        child: SizedBox(width:500,height:300,
          child: ListView(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(text: "Light ", style: TextStyle(color: vpn33, fontSize: 35, fontWeight: FontWeight.w600)),
                    TextSpan(text: "VPN", style: TextStyle(color: vpn33, fontSize: 35, fontWeight: FontWeight.w600)),
                  ]),
                ),
              ),
              Text(
                "Version 1.0.0",
                textAlign: TextAlign.center,
                style: TextStyle(color: vpn22),
              ),
              ColumnDivider(),
              SvgPicture.asset(
                "assets/lightvpn.svg",
                height: 100,
              ),
              ColumnDivider(),
              Text("Light VPN is a free services to secure your connection and circumvent censorship. Check out our Play Store page for more info.", textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
