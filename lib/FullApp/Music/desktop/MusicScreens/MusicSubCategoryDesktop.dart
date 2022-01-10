import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:smartkit/FullApp/Music/Constant.dart';
import 'package:smartkit/FullApp/Music/desktop/MusicScreens/MusicFuntionsDesktop.dart';
import 'package:smartkit/FullApp/Music/desktop/MusicScreens/MusicNowPlayingDesktop.dart';
import 'MusicBottomPanelDesktop.dart';
import 'MusicHomeDesktop.dart';

bool favis = false;

class MusicSubCategoryDesktop extends StatefulWidget {
  MusicSubCategoryDesktop({Key key}) : super(key: key);

  @override
  _MusicSubCategoryStateDesktop createState() => _MusicSubCategoryStateDesktop();
}

class _MusicSubCategoryStateDesktop extends State<MusicSubCategoryDesktop> {
  final TextEditingController _controller = TextEditingController();
  bool isfavsub = false;
  List catList = [
    {'cat_name': "Hindi Top 50", "image": "https://smartkit.wrteam.in/smartkit/music/MusicFlex.svg"},
    {'cat_name': "Punjabi Top 50", "image": "https://smartkit.wrteam.in/smartkit/music/MusicFlex.svg"},
    {'cat_name': "International Top 50 ", "image": "https://smartkit.wrteam.in/smartkit/music/MusicFlex.svg"},
    {'cat_name': "Trending Songs - Hindi ", "image": "https://smartkit.wrteam.in/smartkit/music/MusicFlex.svg"},
    {'cat_name': " New Releases Hot 50 Punjabi  ", "image": "https://smartkit.wrteam.in/smartkit/music/MusicFlex.svg"}
  ];
  // bool isplaying = false;
  int isfavindex = 0;
  int isplayindex = 0;
  bool isplay = false;

  @override
  void initState() {
    super.initState();
    isSearching = false;
    panelController = PanelController();
  }

  @override
  void dispose() {
    if (!panelController.isPanelClosed) {
      panelController.close();
    }
    player.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: getAppbar(), body: getContent());
  }

  Icon iconSearch = Icon(
    Icons.search,
    color: Colors.white,
  );

  Widget appBarTitle = Text(
    appname,
    style: TextStyle(color: Colors.white),
  );

  getAppbar() {
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
      actions: <Widget>[
        IconButton(
          icon: iconSearch,
          onPressed: () {
            // print("call search");
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
                // _handleSearchStart();
              } else {
                // _handleSearchEnd();

                // print("cur list**${curPlayList.length}");
              }
            });
          },
        )
      ],
    );
  }

  getContent() {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(25.0),
      topRight: Radius.circular(25.0),
    );
    return SlidingUpPanel(
        borderRadius: radius,
        panel: MusicnowplayingDesktop(),
        minHeight: 85,
        controller: panelController,
        maxHeight: MediaQuery.of(context).size.height,
        backdropEnabled: true,
        backdropOpacity: 0.5,
        parallaxEnabled: true,
        collapsed: GestureDetector(
          child: Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: radius),
            child: BottomPanelDesktop(),
          ),
          onTap: () {
            panelController.open();
          },
        ),
        body: subcatLayout()

        //subcatLayout(),
        );
  }

  Widget subcatLayout() {
    return Padding(
        padding: const EdgeInsets.only(bottom: 150.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: catList.length,
            itemBuilder: (context, index) {
              return radiolistItem(
                index,
                catList,
              );
            },
          ),
        ));
  }

  Widget radiolistItem(
    int index,
    List catRadioList,
  ) {
    return GestureDetector(
      child: Card(
          elevation: 5.0,
          child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: SvgPicture.network(
                            catRadioList[index]['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ))),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      catRadioList[index]['cat_name'],
                      style: Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      // dense: true,
                    ),
                  )),
                  IconButton(
                      icon: Icon(
                        isplayindex == index
                            ? isplay == true
                                ? Icons.pause
                                : Icons.play_arrow
                            : Icons.play_arrow,
                        size: 40,
                        color: primary,
                      ),
                      onPressed: () {
                        setState(() {
                          isplayindex = index;

                          if (isplay == true) {
                            isplay = false;

                            player.pause();
                          } else {
                            isplay = true;

                            player.play();
                          }
                        });
                      }),
                  IconButton(
                    icon: Icon(
                      isfavindex == index
                          ? isfavsub == true
                              ? Icons.favorite
                              : Icons.favorite_border
                          : Icons.favorite_border,
                      size: 30,
                      color: primary,
                    ),
                    onPressed: () {
                      setState(() {
                        isfavindex = index;
                        if (isfavsub == true) {
                          isfavsub = false;
                        } else {
                          isfavsub = true;
                        }
                      });
                    },
                  ),
                ],
              ))),
      onTap: () {
        curPos = index;
      },
    );
  }

  Widget catListITem(int index) {
    return GestureDetector(
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 5.0,
          child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SvgPicture.network(
                  catList[index]['image'],
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                )),
            Container(
              width: double.infinity,
              color: Colors.black.withOpacity(0.6),
              padding: const EdgeInsets.all(5.0),
              child: Text(
                catList[index]['cat_name'],
                style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ])),
      onTap: () {},
    );
  }
}
