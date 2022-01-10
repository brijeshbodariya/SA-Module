import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:smartkit/FullApp/Vpn/widget/customDivider.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';

class VpnSharePageTablet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: vpn11,
      appBar: vpnSetAppbar("Invite Friends"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _inviteFriendsWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _inviteFriendsWidget(BuildContext bcontext) {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CachedNetworkImage(
                imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/vpnshare.png",
                //height: 200,
              ),
              ColumnDivider(),
              SizedBox(height: 20),
              Text(
                "Share free VPN experince",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: vpn22, decoration: TextDecoration.underline),
                textAlign: TextAlign.center,
              ),
              ColumnDivider(),
              Text(
                "Help your friend stay anonymous, access Restricted content and enjoy streaming services from all regions with Light VPN.",
                style: TextStyle(fontSize: 15, color: vpn77),
                textAlign: TextAlign.center,
              ),
              ColumnDivider(),
              SizedBox(height: 20),
              Center(
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: vpn22.withOpacity(.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    )
                  ], borderRadius: BorderRadius.circular(10), color: vpn22),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                      primary: vpn22,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      "Share With Friend",
                      style: Theme.of(bcontext).textTheme.subtitle1.merge(TextStyle(color: Colors.white)),
                    ),
                    onPressed: _shareClick,
                  ),
                ),
              ),
              ColumnDivider(space: 80)
            ],
          ),
        ),
      ),
    );
  }

  void _shareClick() async {
    Share.share(
      "Check this cool vpn!\nhttps://play.google.com/store/apps/details?id=" + (""),
    );
  }
}
