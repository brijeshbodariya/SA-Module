import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smartkit/FullApp/Music/Constant.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicFuntionsMobile.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicHomeTabMobile.dart';
import 'package:smartkit/FullApp/Music/mobile/MusicScreens/MusicNowPlayingMobile.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';
import 'MusicAllMobile.dart';
import 'MusicBottomPanelMobile.dart';
import 'MusicCategoryMobile.dart';
import 'MusicFavouriteMobile.dart';

///all radio station is loading
bool loading = true;

///offset for load more
int offset = 0;

///total radio station
int total = 0;

///no of item to load in one time
int perPage = 10;

///temp radio list for load more
// List<Model> tempSongList = [];

///is error exist
bool errorExist = false;

///search list
// List<Model> searchList = [];

///favorite database
// var db = Favourite_Helper();

///bottom panel
PanelController panelController;

///after search result list
// List<Model> searchresult = [];

///currently is searching
bool isSearching;

///home tab controller
TabController tabController;

class MusicHomeMobile extends StatefulWidget {
  MusicHomeMobile({Key key}) : super(key: key);

  @override
  _MusicHomeStateMobile createState() => _MusicHomeStateMobile();
}

class _MusicHomeStateMobile extends State<MusicHomeMobile> with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final TextEditingController _controller = TextEditingController();

  Icon iconSearch = Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget appBarTitle = Text(
    "Music",
    style: TextStyle(color: Colors.white),
  );

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  void initState() {
    panelController = PanelController();
    // Initialize the Tab Controller
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
            key: _globalKey,
            appBar: getAppbar(),
            drawer: getDrawer(),
            body: SlidingUpPanel(
                borderRadius: radius,
                panel: MusicnowplayingMobile(),
                minHeight: 85,
                controller: panelController,
                maxHeight: MediaQuery.of(context).size.height,
                backdropEnabled: true,
                backdropOpacity: 0.5,
                parallaxEnabled: true,
                collapsed: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
                    child: BottomPanelMobile(),
                  ),
                  onTap: () {
                    panelController.open();
                  },
                ),
                body: getTabBarView(<Widget>[
                  Directionality(textDirection: direction, child: MusicHometabMobile()),
                  Directionality(textDirection: direction, child: MusicCategoryMobile()),
                  Directionality(textDirection: direction, child: MusicAllMobile()),
                ]))));
  }

  AppBar getAppbar() {
    return AppBar(
      title: appBarTitle,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [secondary, primary.withOpacity(0.5), primary.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Add one stop for each color. Stops should increase from 0 to 1
              stops: [0.15, 0.5, 0.7]),
        ),
      ),
      centerTitle: true,
      bottom: getTabBar(),
      actions: <Widget>[
        IconButton(
          icon: iconSearch,
          onPressed: () {
            //print("call search");
            if (!mounted) return;
            setState(() {
              if (iconSearch.icon == Icons.search) {
                iconSearch = Icon(
                  Icons.close,
                  color: Colors.white,
                );
                appBarTitle = TextField(
                  controller: _controller,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.white),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                  // onChanged: searchOperation,
                );
                _handleSearchStart();
              } else {
                _handleSearchEnd();

                //print("cur list**${curPlayList.length}");
              }
            });
          },
        )
      ],
    );
  }

  void _handleSearchEnd() {
    if (!mounted) return;
    setState(() {
      iconSearch = Icon(
        Icons.search,
        color: Colors.white,
      );
      appBarTitle = Text(
        "Music",
        style: TextStyle(color: Colors.white),
      );
      isSearching = false;
      _controller.clear();
      //searchresult.clear();
    });
  }

  void _handleSearchStart() {
    if (!mounted) return;
    setState(() {
      isSearching = true;
      tabController.animateTo(2);
      //_myTabbedPageKey.currentState.tabController.animateTo(2);
    });
  }

  Drawer getDrawer() {
    return Drawer(
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [secondary, primary.withOpacity(0.5), primary.withOpacity(0.8)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.2, 0.4, 0.9],
                tileMode: TileMode.clamp),
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    tabController.animateTo(0);
                  }),
              ListTile(
                  leading: Icon(Icons.category, color: Colors.white),
                  title: Text(
                    'Category',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    tabController.animateTo(1);
                  }),
              ListTile(
                  leading: Icon(Icons.radio, color: Colors.white),
                  title: Text(
                    'All Music',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    tabController.animateTo(2);
                  }),
              ListTile(
                  leading: Icon(Icons.favorite, color: Colors.white),
                  title: Text(
                    'Favourite',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Directionality(
                              textDirection: direction,
                              // set this property
                              child: MusicFavouriteMobile()),
                        ));
                  }),
              Divider(),
              ListTile(
                  leading: Icon(Icons.share, color: Colors.white),
                  title: Text(
                    'Share App',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.security, color: Colors.white),
                  title: Text(
                    'Privacy Policy',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.warning, color: Colors.white),
                  title: Text(
                    'Terms & Conditions',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text(
                    'About Us',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                  leading: Icon(Icons.star, color: Colors.white),
                  title: Text(
                    'Rate App',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  }),
            ],
          )),
    );
  }

  TabBarView getTabBarView(List<Widget> tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          text: 'Home',
        ),
        Tab(
          text: 'Category',
        ),
        Tab(
          text: 'All Music',
        ),
      ],
      controller: tabController,
    );
  }

  Future<bool> _onWillPop() async {
    if (!panelController.isPanelClosed) {
      panelController.close();
      return Future<bool>.value(false);
    } else {
      return Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    }
  }
}
