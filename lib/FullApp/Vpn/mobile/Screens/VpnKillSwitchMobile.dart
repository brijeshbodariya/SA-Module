import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/widget/customDivider.dart';

class VpnKillSwitchMobile extends StatefulWidget {
  VpnKillSwitchMobile({Key key}) : super(key: key);

  @override
  _VpnKillSwitchStateMobile createState() => _VpnKillSwitchStateMobile();
}

class _VpnKillSwitchStateMobile extends State<VpnKillSwitchMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: vpnSetAppbar("Kill Switch"),
      body: Center(
        child: SizedBox(height:400,
          child: ListView(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            children: [
              Text(
                "Follow the instruction to block unprotected traffic",
                style: TextStyle(fontSize: 20, color: vpn22),
                textAlign: TextAlign.center,
              ),
              ColumnDivider(space: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: vpncirculargradient_box,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "1. Open Android settings by clicking the button bellow.",
                      style: TextStyle(color: Colors.white, letterSpacing: 0.5),
                    ),
                    ColumnDivider(),
                    Text(
                      "2. Choose Light VPN settings.",
                      style: TextStyle(color: Colors.white, letterSpacing: 0.5),
                    ),
                    ColumnDivider(),
                    Text(
                      "3. Enable both 'Always-on VPN' and 'Block connection without VPN'.",
                      style: TextStyle(color: Colors.white, letterSpacing: 0.5),
                    ),
                    ColumnDivider(space: 15),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),
                      //
                      child: Text(
                        "Open Android Settings",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      // onPressed: "openKillSwitch",
                      // shape: StadiumBorder(),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              ColumnDivider(),
              Text(
                "If these options are missing, this feature not available on your devices.",
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
