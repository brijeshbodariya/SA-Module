import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Vpn/widget/customDivider.dart';

class VpnSelectVpn extends StatefulWidget {
  VpnSelectVpn({Key key}) : super(key: key);

  @override
  _VpnSelectVpnState createState() => _VpnSelectVpnState();
}

class _VpnSelectVpnState extends State<VpnSelectVpn> with TickerProviderStateMixin {
  int page = 0;

  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: vpnSetAppbar("Select VPN"),
      body: Column(
        children: [
          Container(
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
              isScrollable: true,
              labelColor: vpn22,
              indicatorColor: vpn22,
              unselectedLabelColor: purpalOpacity22,
              tabs: [
                Tab(
                    child: SamrtKitTabText1(
                  title: "Free Servers",
                )),
                Tab(
                    child: SamrtKitTabText1(
                  title: "Premium Servers",
                )),
              ],
            ),
          ),
          SamrtKitHomeTabView(tabController: _tabController),
        ],
      ),
      bottomNavigationBar: vpnSetBottomNavigation(1, context, false),
    );
  }
}

class SamrtKitTabText1 extends StatelessWidget {
  final String title;
  final double indicatorwidth;

  const SamrtKitTabText1({
    Key key,
    this.title,
    this.indicatorwidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 12.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Open Sans',
              // fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

class LeftButtonShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 30, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class RightButtonShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(30, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class VpnServerButton extends StatefulWidget {
  final String vpnServername, flag;
  final bool active;
  // final Function customTap;

  const VpnServerButton({Key key, this.active, this.vpnServername, this.flag}) : super(key: key);

  @override
  _VpnServerButtonState createState() => _VpnServerButtonState();
}

class _VpnServerButtonState extends State<VpnServerButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // _vpnSelectClick(context);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
        decoration: vpncircularbox(Color(0xffD8D8D8).withOpacity(0.3)),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: "https://smartkit.wrteam.in/smartkit/vpn/${widget.flag}",
              height: 30,
              width: 30,
            ),
            RowDivider(),
            Expanded(
              child: Text(
                "${widget.vpnServername}",
                style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                      color: vpn22,
                    )),
              ),
            ),
            widget.active
                ? Icon(
                    Icons.check_circle_outline,
                    size: 20,
                    color: vpn77,
                  )
                : Icon(
                    Icons.radio_button_unchecked,
                    size: 20,
                    color: vpn77,
                  )
          ],
        ),
      ),
    );
  }
}

class SamrtKitHomeTabView extends StatefulWidget {
  const SamrtKitHomeTabView({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  _SamrtKitHomeTabViewState createState() => _SamrtKitHomeTabViewState();
}

class _SamrtKitHomeTabViewState extends State<SamrtKitHomeTabView> {
  List vpnServersfree = [
    {'flag': "canada.png", 'vpnServerName': 'canada', 'status': true},
    {'flag': "italy.png", 'vpnServerName': 'italy', 'status': false},
    {'flag': "finland.png", 'vpnServerName': 'finland', 'status': false},
    {'flag': "australia.png", 'vpnServerName': 'australia', 'status': true},
  ];
  List vpnServerspremium = [
    {'flag': "japan.png", 'vpnServerName': 'japan', 'status': true},
    {'flag': "ireland.png", 'vpnServerName': 'ireland', 'status': true},
    {'flag': "united-kingdom.png", 'vpnServerName': 'united-kingdom', 'status': false},
    {'flag': "united-states-of-america.png", 'vpnServerName': 'united-states-of-america', 'status': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: widget._tabController,
        children: [
          freeListWidget(),
          // second tab bar view widget
          premiumListWidget()
        ],
      ),
    );
  }

  Widget freeListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: vpnServersfree.length != null ? vpnServersfree.length : 1,
        itemBuilder: (BuildContext context, int index) {
          return VpnServerButton(
            active: vpnServersfree[index]['status'],
            vpnServername: vpnServersfree[index]['vpnServerName'],
            flag: vpnServersfree[index]['flag'],
          );
        });
  }

  Widget premiumListWidget() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: vpnServerspremium.length != null ? vpnServerspremium.length : 1,
        itemBuilder: (BuildContext context, int index) {
          return VpnServerButton(
            active: vpnServerspremium[index]['status'],
            vpnServername: vpnServerspremium[index]['vpnServerName'],
            flag: vpnServerspremium[index]['flag'],
          );
        });
  }
}
