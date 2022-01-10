import 'package:cached_network_image/cached_network_image.dart';
import 'package:smartkit/FullApp/eStudy/tablet/Activity/CourseDetailActivityTablet.dart';
import 'package:smartkit/FullApp/eStudy/tablet/Activity/HomeActivityTablet.dart';
import 'package:smartkit/FullApp/eStudy/Model/All_Course_Model.dart';
import 'package:smartkit/FullApp/eStudy/Model/Category_Model.dart';
import 'package:smartkit/FullApp/eStudy/Model/My_Course_Model.dart';
import 'package:smartkit/FullApp/eStudy/Model/Saved_Course_Model.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/eStudy/helper/StringsRes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTablet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeTabletState();
  }
}

class HomeTabletState extends State<HomeTablet> {
  double trendingheight = 100;
  double popularheight = 180;
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  Widget DisplayCategories() {
    return Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 10,
        runSpacing: 4.0,
        children: List.generate(
            CategoryList.length >= 10 ? 10 : CategoryList.length,
            (i) => GestureDetector(
                  onTap: () {
                    print("===id==${CategoryList[i].id}");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeActivityTablet()));
                  },
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: ColorsRes.introMessagecolor)),
                      padding: EdgeInsetsDirectional.only(start: 8, end: 8, top: 8, bottom: 8),
                      child: Text(CategoryList[i].CategoryName.trim(),
                          style: TextStyle(
                            height: 1.0,
                            color: ColorsRes.introMessagecolor,
                          ))),
                )));
  }

  Widget DisplayPopularCourse(bool isrow) {
    return SizedBox(
      height: isrow ? trendingheight : popularheight,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: SavedCourseList.length,
          itemBuilder: (context, index) {
            Saved_Course_Model savedCourse = SavedCourseList[index];
            return GestureDetector(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.only(bottom: 12, right: 10),
                  decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                  child: Container(
                      width: isrow ? 300 : 160,
                      child: isrow
                          ? Row(children: <Widget>[
                              DesignConfig.DisplayCourseImage(SavedCourseList[index].imageList[1].image, 100, 80),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: DesignConfig.DisplayCourseTitle(savedCourse.CourseName, 2),
                                    ),
                                    DesignConfig.DisplayCoursePriceSaved_course(savedCourse, false, false),
                                  ],
                                ),
                              ),
                            ])
                          : Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: SavedCourseList[index].imageList[1].image,
                                  fit: BoxFit.fill,
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                ),
                              ),
                              DesignConfig.DisplayCourseTitle(savedCourse.CourseName, 2),
                              DesignConfig.DisplayCoursePriceSaved_course(savedCourse, false, false),
                              SizedBox(height: 5)
                            ])),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailActivityTablet(id: index, type: "savecourse")));
                });
          }),
    );
  }

  Widget TopRelatedCourse() {
    return Container(
        child: GridView.count(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      children: List.generate(AllCourseList.length > 3 ? 3 : AllCourseList.length, (index) {
        All_Course_Model allCourse = AllCourseList[index];
        return SizedBox(
            child: GestureDetector(
                child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.only(bottom: 12, right: 10),
                    decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                    child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: AllCourseList[index].imageList[1].image,
                          fit: BoxFit.fill,
                          height: double.maxFinite,
                          width: double.maxFinite,
                        ),
                      ),
                      DesignConfig.DisplayCourseTitle(allCourse.CourseName, 2),
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 5),
                          alignment: Alignment.topLeft,
                          child: Text(
                            AllCourseList[index].CourseSpeker,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: ColorsRes.introMessagecolor, fontSize: 10),
                            textAlign: TextAlign.left,
                          )),
                      DesignConfig.DisplayBundlePriceAll_course(allCourse, false, false),
                      SizedBox(height: 5)
                    ])),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailActivityTablet(id: index, type: "allcourse")));
                }));
      }),
    ));
  }

  Widget DisplayNewCourse(bool isrow) {
    return SizedBox(
      height: isrow ? trendingheight : popularheight,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: MyCourseList.length,
          itemBuilder: (context, index) {
            My_Course_Model myCourse = MyCourseList[index];
            return GestureDetector(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.only(bottom: 12, right: 10),
                  decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                  child: Container(
                      width: isrow ? 300 : 160,
                      child: isrow
                          ? Row(children: <Widget>[
                              DesignConfig.DisplayCourseImage(MyCourseList[index].imageList[1].image, 100, 80),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: DesignConfig.DisplayCourseTitle(myCourse.CourseName, 2),
                                    ),
                                    DesignConfig.DisplayCoursePriceMy_course(myCourse, false, false),
                                  ],
                                ),
                              ),
                            ])
                          : Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: MyCourseList[index].imageList[1].image,
                                  fit: BoxFit.fill,
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                ),
                              ),
                              DesignConfig.DisplayCourseTitle(myCourse.CourseName, 2),
                              DesignConfig.DisplayCoursePriceMy_course(myCourse, false, false),
                              SizedBox(height: 5)
                            ])),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailActivityTablet(id: index, type: "mycourse")));
                });
          }),
    );
  }

  Widget DisplayTopRatedCourse(bool isrow) {
    return SizedBox(
      height: isrow ? trendingheight : popularheight,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AllCourseList.length,
          itemBuilder: (context, index) {
            All_Course_Model allCourse = AllCourseList[index];
            return GestureDetector(
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.only(bottom: 12, right: 10),
                  decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                  child: Container(
                      width: isrow ? 300 : 160,
                      child: isrow
                          ? Row(children: <Widget>[
                              DesignConfig.DisplayCourseImage(AllCourseList[index].imageList[1].image, 100, 80),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: DesignConfig.DisplayCourseTitle(allCourse.CourseName, 2),
                                    ),
                                    DesignConfig.DisplayBundlePriceAll_course(allCourse, false, false),
                                  ],
                                ),
                              ),
                            ])
                          : Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: AllCourseList[index].imageList[1].image,
                                  fit: BoxFit.fill,
                                  height: double.maxFinite,
                                  width: double.maxFinite,
                                ),
                              ),
                              DesignConfig.DisplayCourseTitle(allCourse.CourseName, 2),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    AllCourseList[index].CourseSpeker,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: ColorsRes.introMessagecolor, fontSize: 10),
                                    textAlign: TextAlign.left,
                                  )),
                              DesignConfig.DisplayBundlePriceAll_course(allCourse, false, false),
                              SizedBox(height: 5)
                            ])),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CourseDetailActivityTablet(id: index, type: "allcourse")));
                });
          }),
    );
  }

  Widget HomeMenu() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          snap: false,
          pinned: true,
          floating: false,
          flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "", style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28), //TextStyle
              ), //Text
              background: Stack(children: [
                Container(
                  color: ColorsRes.bgcolor,
                  height: MediaQuery.of(context).size.width,
                  child: SizedBox(
                      child: SvgPicture.network(
                    'https://smartkit.wrteam.in/smartkit/eStudy/topback.svg',
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  )),
                ),
                Container(
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .13),
                    alignment: Alignment.bottomLeft,
                    child: Column(children: [
                      Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(left: 18, right: 20),
                          child: Text(
                            StringsRes.User_Name_Text_lb,
                            style: TextStyle(color: ColorsRes.white, fontSize: 22),
                          )),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(left: 18, right: 20),
                        child: Text(StringsRes.User_Message_Text_lb, style: TextStyle(color: ColorsRes.applightcolor, fontSize: 18)),
                      ),
                    ])),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).size.height * .26),
                  decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                  child: Container(
                    height: 43,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      style: TextStyle(color: ColorsRes.black),
                      cursorColor: ColorsRes.black,
                      decoration: InputDecoration(
                        hintText: StringsRes.Search_PlaceHolder_lb,
                        hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: ColorsRes.searplaceholdercolor)),
                        border: InputBorder.none,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                              child: Icon(Icons.search, color: ColorsRes.appcolor),
                            )),
                      ),
                    ),
                  ),
                ),
              ])),
          actions: <Widget>[
            FittedBox(
                child: Container(
                    margin: EdgeInsets.all(MediaQuery.of(context).size.height * .01),
                    alignment: Alignment.bottomLeft,
                    child: Row(children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        width: 45.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://smartkit.wrteam.in/smartkit/eStudy/propic.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ]))), //IconButton//IconButton
          ], //FlexibleSpaceBar
          expandedHeight: MediaQuery.of(context).size.height * .3,
          backgroundColor: ColorsRes.appcolor,
          leading: Container(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * .02),
            child: new Wrap(
              alignment: WrapAlignment.spaceAround,
              spacing: 5.0,
              runSpacing: 5.0,
              direction: Axis.vertical, // main axis (rows or columns)
              children: <Widget>[
                SvgPicture.network("https://smartkit.wrteam.in/smartkit/eStudy/homelogo.svg", fit: BoxFit.fill),
              ],
            ),
          ), //IconButton
        ), //SliverAppBar
        SliverList(
            delegate: SliverChildListDelegate([
          Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            CategoryList.length == 0
                ? Container()
                : Padding(
                    padding: EdgeInsetsDirectional.only(top: 20, start: 10, end: 10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          StringsRes.Categories_lb,
                          style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(), // Defaults to a flex of one.
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 5, top: 5, bottom: 5),
                          child: GestureDetector(
                            child: Text(StringsRes.View_all_lb, style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 12)),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ]),
                      SizedBox(height: 10),
                      DisplayCategories(),
                    ])),
            MyCourseList.length != 0
                ? Padding(
                    padding: EdgeInsetsDirectional.only(top: 15, start: 10, end: 10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          StringsRes.New_Courses_lb,
                          style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(), // Defaults to a flex of one.
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 5, top: 5, bottom: 5),
                          child: GestureDetector(
                            child: Text(StringsRes.View_all_lb, style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 12)),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ]),
                      DisplayNewCourse(true),
                    ]))
                : new Container(),
            AllCourseList.length != 0
                ? Padding(
                    padding: EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          StringsRes.Top_Rated_Course_lb,
                          style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(), // Defaults to a flex of one.
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 5, top: 5, bottom: 5),
                          child: GestureDetector(
                            child: Text(StringsRes.View_all_lb, style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 12)),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ]),
                      DisplayTopRatedCourse(false),
                    ]))
                : new Container(),
            AllCourseList.length != 0
                ? Padding(
                    padding: EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          StringsRes.Popular_Course_lb,
                          style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(), // Defaults to a flex of one.
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 5, top: 5, bottom: 5),
                          child: GestureDetector(
                            child: Text(StringsRes.View_all_lb, style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 12)),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ]),
                      DisplayPopularCourse(false),
                    ]))
                : new Container(),
            AllCourseList.length != 0
                ? Padding(
                    padding: EdgeInsetsDirectional.only(top: 10, start: 10, end: 10),
                    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Row(children: <Widget>[
                        Text(
                          StringsRes.Top_Course_in_Marketing_lb,
                          style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(), // Defaults to a flex of one.
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 5, top: 5, bottom: 5),
                          child: GestureDetector(
                            child: Text(StringsRes.View_all_lb, style: TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold, fontSize: 12)),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                        ),
                      ]),
                      TopRelatedCourse(),
                    ]))
                : new Container(),
            SizedBox(height: 60),
          ]),
        ]) //SliverChildBuildDelegate
            )
      ], //<Widget>[]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsRes.bgPage,
      resizeToAvoidBottomInset: false,
      body: HomeMenu(),
    );
  }
}
