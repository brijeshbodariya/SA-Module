import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagAllCatTablet.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagCartTablet.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagNotificationTablet.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagProductDetailTablet.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagProductListTablet.dart';
import 'package:smartkit/FullApp/Grobag/tablet/Screen/GrobagSearchTablet.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

import 'GrobagFavoriteTablet.dart';
import 'GrobagMyProfileTablet.dart';

class GrobagHomeTablet extends StatefulWidget {
  @override
  _GrobagHomeTabletState createState() => _GrobagHomeTabletState();
}

class _GrobagHomeTabletState extends State<GrobagHomeTablet> {
  int _curBottom = 0;

  List<Widget> fragments;

  @override
  void initState() {
    super.initState();
    fragments = [
      HomePageTablet(),
      GrobagAllCatTablet(),
      GrobagFavoriteTablet(),
      GrobagMyProfileTablet(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _curBottom == 0
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Your Location ',
                          style: TextStyle(fontSize: 14),
                        ),
                        SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/edit-loc.svg')
                      ],
                    ),
                    Text('Gandhidham'),
                  ],
                ),
                actions: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/notification.svg'),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GrobagNotificationTablet()));
                    },
                  ),
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 18),
                      child: SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/cart.svg'),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GrobagCartTablet()));
                    },
                  ),
                ],
              )
            : AppBar(
                backgroundColor: white,
                automaticallyImplyLeading: false,
                title: Text(
                  _curBottom == 1
                      ? 'Category'
                      : _curBottom == 2
                          ? 'Favorite'
                          : 'Profile',
                  style: TextStyle(
                    color: fontColor,
                  ),
                ),
              ),

        //  GrobagAppbar(
        //     isback: false,
        // ),
        bottomNavigationBar: getBottomNav(),
        body: fragments[_curBottom]);
  }

  getBottomNav() {
    return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.network(
              'https://smartkit.wrteam.in/smartkit/grobag/home.svg',
            ),
            activeIcon: SvgPicture.network(
              'https://smartkit.wrteam.in/smartkit/grobag/active-home.svg',
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/category.svg'),
            activeIcon: SvgPicture.network(
              'https://smartkit.wrteam.in/smartkit/grobag/active-category.svg',
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/favorite.svg'),
            activeIcon: SvgPicture.network(
              'https://smartkit.wrteam.in/smartkit/grobag/active-favorite.svg',
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/profile.svg'),
            activeIcon: SvgPicture.network(
              'https://smartkit.wrteam.in/smartkit/grobag/active-profile.svg',
            ),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _curBottom,
        selectedItemColor: primary,
        onTap: (int index) {
          if (mounted)
            setState(() {
              _curBottom = index;
            });
        },
        elevation: 25);
  }
}

List catList = [
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-1.png", 'title': "Vegetables"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-2.png", 'title': "Fruits"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-3.png", 'title': "Meat"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-4.png", 'title': "Milk&Egg"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-5.png", 'title': "Fish"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-6.png", 'title': "Drinks"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-7.png", 'title': "Sea Food"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-8.png", 'title': "Cake"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-9.png", 'title': "Fish"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-10.png", 'title': "Drinks"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-11.png", 'title': "Sea Food"},
  {'img': "https://smartkit.wrteam.in/smartkit/grobag/cat-image-12.png", 'title': "Cake"},
];

class HomePageTablet extends StatefulWidget {
  @override
  _HomePageTabletState createState() => _HomePageTabletState();
}

List<String> searchList = [
  "Categories",
  "Sections",
  "Product",
];
String curStatus = "Categories";

class _HomePageTabletState extends State<HomePageTablet> {
  final _controller = PageController();
  List<Widget> pages = [];

  int _curSlider = 0;

  List homeSliderList = [
    "https://smartkit.wrteam.in/smartkit/grobag/slider-a.png",
    "https://smartkit.wrteam.in/smartkit/grobag/banner-a.png",
    "https://smartkit.wrteam.in/smartkit/grobag/banner-b.png",
    "https://smartkit.wrteam.in/smartkit/grobag/banner-c.png",
  ];
  List offerBannerList = [
    "https://smartkit.wrteam.in/smartkit/grobag/banner-a.png",
    "https://smartkit.wrteam.in/smartkit/grobag/banner-b.png",
    "https://smartkit.wrteam.in/smartkit/grobag/banner-c.png",
  ];
  List sectList = [
    {
      'section': "Best Selling Items",
      'productList': [
        {'tag': "4", 'img': "https://smartkit.wrteam.in/smartkit/grobag/strawberries.png", 'name': "Starwberries", 'descprice': "1700", 'price': "2000", 'qty': '250 gm'},
        {'tag': "5", 'img': "https://smartkit.wrteam.in/smartkit/grobag/kiwi.png", 'name': "Fresh Kiwi", 'descprice': "25", 'price': "2200", 'qty': '250 gm'},
        {'tag': "1", 'img': "https://smartkit.wrteam.in/smartkit/grobag/banana.png", 'name': "Banana", 'descprice': "25", 'price': "50", 'qty': "1 kg"},
        {'tag': "2", 'img': "https://smartkit.wrteam.in/smartkit/grobag/apple.png", 'name': "Shimla Apple", 'descprice': "1000", 'price': "1200", 'qty': '500 gm'},
        {'tag': "3", 'img': "https://smartkit.wrteam.in/smartkit/grobag/watermelon.png", 'name': "Yummy Watermelon", 'descprice': "1300", 'price': "1400", 'qty': '2 kg'},
      ]
    },
    {
      'section': "Exclusive",
      'productList': [
        {'tag': "8", 'img': "https://smartkit.wrteam.in/smartkit/grobag/red_chili.png", 'name': "Spicy Red Chili", 'descprice': "1300", 'price': "1400", 'qty': '1 kg'},
        {'tag': "6", 'img': "https://smartkit.wrteam.in/smartkit/grobag/mangosteens.png", 'name': "Mangosteens", 'descprice': "2500", 'price': "3500", 'qty': '250 gm'},
        {'tag': "7", 'img': "https://smartkit.wrteam.in/smartkit/grobag/peas.png", 'name': "Green Peas", 'descprice': "1000", 'price': "1000", 'qty': '250 gm'},
        {'tag': "9", 'img': "https://smartkit.wrteam.in/smartkit/grobag/muskmelon.png", 'name': "Muskmelon", 'descprice': "1700", 'price': "2000", 'qty': '500 gm'},
        {'tag': "5", 'img': "https://smartkit.wrteam.in/smartkit/grobag/kiwi.png", 'name': "Fresh Kiwi", 'descprice': "25", 'price': "2200", 'qty': '250 gm'},
      ]
    },
  ];

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
        child: SingleChildScrollView(
            child: Column(
          children: [_searchbar(), _slider(), _catList(), _section(), _offerImage()],
        )));
  }

  void initializeSlider() {
    setState(() {
      pages = homeSliderList.map((slider) {
        return _buildImagePageItem(slider);
      }).toList();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initializeSlider();
    WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  _offerImage() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 10),
      itemCount: offerBannerList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _getOfferImage(index);
      },
    );
  }

  _searchbar() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 30,
            padding: EdgeInsets.all(5.0),
            margin: const EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: fontLight.withOpacity(0.5)),
              borderRadius: BorderRadius.all(Radius.circular(5.0) //                 <--- border radius here
                  ),
            ),
            child: Center(
              child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                dropdownColor: primary.withOpacity(0.9),
                isExpanded: false,
                value: curStatus,
                onChanged: (newValue) {
                  setState(() {
                    curStatus = newValue;
                  });
                },
                items: searchList.map((String st) {
                  return DropdownMenuItem<String>(
                    value: st,
                    child: Text(
                      st,
                    ),
                  );
                }).toList(),
              )),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Container(
                height: 30,
                child: TextField(
                  enabled: false,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(15.0, 5.0, 0, 5.0),
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    isDense: true,
                    hintText: 'Search for product',
                    hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(
                          color: fontColor,
                        ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.network(
                        'https://smartkit.wrteam.in/smartkit/grobag/search-home.svg',
                      ),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => GrobagSearchTablet()));
              },
            ),
          ),
        ],
      ),
    );
  }

  _getOfferImage(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: InkWell(
        child: CachedNetworkImage(
          imageUrl: offerBannerList[index],
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GrobagProducListTablet(
                        title: catList[index]["title"],
                      )));
        },
      ),
    );
  }

  Widget _slider() {
    double height = MediaQuery.of(context).size.width / 2.2;

    return pages.isNotEmpty
        ? Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: height,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: PageView.builder(
                  itemCount: homeSliderList.length,
                  scrollDirection: Axis.horizontal,
                  controller: _controller,
                  physics: AlwaysScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    if (mounted)
                      setState(() {
                        _curSlider = index;
                      });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return pages[index];
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: _buildIndicator(),
                ),
              ),
            ],
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Container(
                height: height,
                width: double.infinity,
                color: lightBack,
              ),
            ),
          );
  }

  _section() {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: sectList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _singleSection(index);
      },
    );
  }

  _singleSection(int index) {
    return sectList[index]["productList"].length > 0
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _getHeading(sectList[index]["section"], index),
                _getSection(index),
              ],
            ),
          )
        : Container();
  }

  _getSection(int i) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        itemCount: sectList[i]["productList"].length < 10 ? sectList[i]["productList"].length : 10,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsetsDirectional.only(end: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GrobagProductDetailTablet(
                              pos: 0,
                            )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 5.0),
                      child: CachedNetworkImage(imageUrl: sectList[i]['productList'][index]['img'], fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    sectList[i]['productList'][index]['qty'],
                    style: Theme.of(context).textTheme.caption.copyWith(
                          color: secondary,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    sectList[i]['productList'][index]['name'],
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: fontColor,
                          fontWeight: FontWeight.w700,
                        ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ " + sectList[i]['productList'][index]['descprice'],
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Spacer(),
                      new Container(
                        width: 24,
                        height: 24,
                        decoration: new BoxDecoration(color: primary.withOpacity(0.3), borderRadius: BorderRadius.circular(6)),
                        child: Icon(
                          Icons.add,
                          size: 12,
                          color: primary,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _getHeading(String title, int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'View all',
                style: Theme.of(context).textTheme.caption.copyWith(color: primary),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GrobagProducListTablet(
                            title: title,
                          )));
            },
          ),
        ],
      ),
    );
  }

  _catList() {
    return GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisCount: 4,
        shrinkWrap: true,
        childAspectRatio: 0.8,
        physics: NeverScrollableScrollPhysics(),
        mainAxisSpacing: 5,
        crossAxisSpacing: 10,
        children: List.generate(
          catList.length < 8 ? catList.length : 8,
          (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GrobagProducListTablet(
                              title: catList[index]["title"],
                            )));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(bottom: 5.0),
                      child: CachedNetworkImage(
                        imageUrl: catList[index]["img"],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      catList[index]["title"],
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: fontColor,
                          ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < pages.length; i++) {
      if (_curSlider == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }

    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 25 : 7,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: isActive ? primary : fontLight,
        ));
  }

  void _animateSlider() {
    Future.delayed(Duration(seconds: 30)).then((_) {
      if (mounted) {
        int nextPage = _controller.hasClients ? _controller.page.round() + 1 : _controller.initialPage;

        if (nextPage == homeSliderList.length) {
          nextPage = 0;
        }
        if (_controller.hasClients) _controller.animateToPage(nextPage, duration: Duration(milliseconds: 200), curve: Curves.linear).then((_) => _animateSlider());
      }
    });
  }

  Widget _buildImagePageItem(String slider) {
    double height = MediaQuery.of(context).size.width / 2.2;

    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7.0),
        child: CachedNetworkImage(
          imageUrl: slider,
          height: height,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
      ),
      onTap: () {},
    );
  }
}
