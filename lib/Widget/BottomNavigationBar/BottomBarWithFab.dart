import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';

import 'FAbCenterCircularBottomBar.dart';
import 'FabCorner_BottomNav.dart';
import 'FabMiddle_BottomNav.dart';

class BottombarWithFab extends StatefulWidget {
  BottombarWithFab({Key key}) : super(key: key);

  @override
  _BottombarWithFabState createState() => _BottombarWithFabState();
}

class _BottombarWithFabState extends State<BottombarWithFab> with TickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.black, statusBarIconBrightness: Brightness.dark, systemNavigationBarIconBrightness: Brightness.dark),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "BottomBar With Fab Icon",
          ),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [
              // Tab //
              Container(
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: purpal,
                  indicatorColor: purpal,
                  unselectedLabelColor: purpalOpacity22,
                  tabs: [
                    Tab(
                      child: SamrtKitTabText(
                        title: "Fab Center Circular",
                        indicatorwidth: 60,
                      ),
                    ),
                    Tab(
                      child: SamrtKitTabText(
                        title: "Fab Middle",
                        indicatorwidth: 60,
                      ),
                    ),
                    Tab(
                      child: SamrtKitTabText(
                        title: "Fab Corner",
                        indicatorwidth: 60,
                      ),
                    ),
                  ],
                ),
              ),

              SamrtKitHomeTabView(tabController: _tabController),
            ],
          ),
        ),
      ),
    );
  }
}

class SamrtKitHomeTabView extends StatelessWidget {
  const SamrtKitHomeTabView({
    Key key,
    @required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [FabCenter_BottomNav(), FabMiddle_BottomNav(), FabCorner_BottomNav()],
      ),
    );
  }
}

class SamrtKitTabText extends StatelessWidget {
  final String title;
  final double indicatorwidth;

  const SamrtKitTabText({
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
              fontSize: 21,
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
