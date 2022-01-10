import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:share/share.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import 'package:smartkit/FullApp/Quotes/Bottom_Bar/fancy_bottom_navigation.dart';
import 'package:smartkit/FullApp/Quotes/Helper/Drawer_Scaffold.dart';
import 'package:smartkit/FullApp/Quotes/Helper/menu_screen.dart';
import 'package:smartkit/FullApp/Quotes/QuotesScreen/QuotesLatest.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import '../QuotesMain.dart';
import 'QuotesAuthor.dart';
import 'QuotesCategory.dart';

final List<String> sliderimgList = ['https://smartkit.wrteam.in/smartkit/quotes/1.png', 'https://smartkit.wrteam.in/smartkit/quotes/2.jpg', 'https://smartkit.wrteam.in/smartkit/quotes/3.jpg', 'https://smartkit.wrteam.in/smartkit/quotes/4.jpeg'];

class QuotesHome extends StatefulWidget {
  QuotesHome({Key key}) : super(key: key);

  @override
  _QuotesHomeState createState() => _QuotesHomeState();
}

class _QuotesHomeState extends State<QuotesHome> with SingleTickerProviderStateMixin {
  bool _showAppbar = true;
  int currentPage = 1;
  var selectedMenuItemId = '';
  GlobalKey bottomNavigationKey = GlobalKey();
  static ScrollController _scrollBottomBarController = new ScrollController();
  final PageStorageBucket bucket = PageStorageBucket();
  bool _show = true;
  bool isScrollingDown = false;
  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'category',
        title: 'HOME',
        icon: Icons.home,
      ),
      new MenuItem(
        id: 'trending',
        title: 'TRENDING',
        icon: Icons.new_releases,
      ),
      new MenuItem(
        id: 'author',
        title: 'AUTHOR',
        icon: Icons.person,
      ),
      new MenuItem(
        id: 'share',
        title: 'SHARE APP',
        icon: Icons.share,
      ),
      new MenuItem(
        id: 'rate',
        title: 'RATE APP',
        icon: Icons.star,
      ),
      new MenuItem(
        id: 'about',
        title: 'ABOUT US',
        icon: Icons.help,
      ),
      new MenuItem(
        id: 'privacy',
        title: 'PRIVACY POLICY',
        icon: Icons.security,
      ),
      new MenuItem(
        id: 'terms',
        title: 'TERMS & CONDITIONS',
        icon: Icons.info_outline,
      ),
    ],
  );

  final List<Widget> _children = [
    QuotesLatest(
      key: PageStorageKey('Page1'),
    ),
    QuotesCategory(
      key: PageStorageKey('Page2'),
    ),
    QuotesAuthor(key: PageStorageKey('Page3'))
  ];

  @override
  void initState() {
    super.initState();
    myScroll();
  }

  @override
  void dispose() {
    _scrollBottomBarController.removeListener(() {});
    super.dispose();
  }

  void showBottomBar() {
    setState(() {
      _show = true;
    });
  }

  void hideBottomBar() {
    setState(() {
      _show = false;
    });
  }

  void myScroll() async {
    _scrollBottomBarController.addListener(() {
      if (_scrollBottomBarController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = true;
          hideBottomBar();
        }
      }
      if (_scrollBottomBarController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          showBottomBar();
        }
      }
    });
  }

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
      child: DrawerScaffold(
          percentage: 0.6,
          appBar: AppBarProps(
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: [quotes2, quotes3], stops: [0, 1])),
            ),
            title: Text(appName),
          ),
          showAppBar: _showAppbar,
          bottomNavigationBar: getNavigationBar(),
          menuView: getSliderMenu(),
          contentView: Screen(
            contentBuilder: (context) => LayoutBuilder(
                builder: (context, constraint) => SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollBottomBarController,
                    child: Column(children: <Widget>[
                      Container(
                          child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: autoPlayDemo,
                      )),
                      PageStorage(
                        child: _children[currentPage],
                        bucket: bucket,
                      ),
                    ])
                    //),
                    )),
            color: Colors.white,
          )),
    );
  }

  final CarouselSlider autoPlayDemo = CarouselSlider(
    items: sliderimgList.map(
      (url) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            child: CachedNetworkImage(imageUrl: url, fit: BoxFit.cover, width: 1000.0),
          ),
        );
      },
    ).toList(),
    options: CarouselOptions(
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
      enlargeCenterPage: true,
    ),
  );

  getNavigationBar() {
    return FancyBottomNavigation(
      tabs: [
        TabData(
            iconData: Icons.trending_up,
            title: "Trending",
            onclick: () {
              currentPage = 0;
              selectedMenuItemId = "trending";
            }),
        TabData(
            iconData: Icons.category,
            title: "Category",
            onclick: () {
              currentPage = 1;
              selectedMenuItemId = "category";
            }),
        TabData(
            iconData: Icons.person,
            title: "Author",
            onclick: () {
              currentPage = 2;
              selectedMenuItemId = "author";
            })
      ],
      initialSelection: 1,
      key: bottomNavigationKey,
      onTabChangedListener: (position) {
        if (this.mounted) {
          setState(() {
            currentPage = position;
            if (position == 0) {
              selectedMenuItemId = "trending";
            } else if (position == 1) {
              selectedMenuItemId = "category";
            } else {
              selectedMenuItemId = "author";
            }
          });
        }
      },
    );
  }

  getSliderMenu() {
    return new MenuView(
      menu: menu,
      animation: true,
      selectorColor: Color(0xFF000000),
      color: Theme.of(context).primaryColor,
      selectedItemId: selectedMenuItemId,
      onMenuItemSelected: (String itemId) async {
        selectedMenuItemId = itemId;

        if (itemId == 'category') {
          if (this.mounted) {
            setState(() {
              final FancyBottomNavigationState fState = bottomNavigationKey.currentState;
              fState.setPage(1);
            });
          }
        } else if (itemId == "trending") {
          if (this.mounted) {
            setState(() {
              final FancyBottomNavigationState fState = bottomNavigationKey.currentState;
              fState.setPage(0);
            });
          }
        } else if (itemId == "author") {
          if (this.mounted) {
            setState(() {
              final FancyBottomNavigationState fState = bottomNavigationKey.currentState;
              fState.setPage(2);
            });
          }
        } else if (itemId == "share") {
          String projectAppID, name;
          try {
            // projectAppID = await GetVersion.appID;
            // name = await GetVersion.appName;
            Share.share(name + " \nhttps://play.google.com/store/apps/details?id=" + projectAppID);
          } on Exception {}
        } else if (itemId == "rate") {
          // AppReview.requestReview.then((onValue) {});
        } else if (itemId == 'about') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => About()),
          // );
        } else if (itemId == 'privacy') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Privacy_Policy()),
          // );
        } else if (itemId == 'terms') {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Terms()),
          // );
        }
      },
    );
  }
}
