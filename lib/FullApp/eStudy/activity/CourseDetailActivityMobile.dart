
import 'package:smartkit/FullApp/eStudy/Model/All_Course_Model.dart';
import 'package:smartkit/FullApp/eStudy/Model/Lessons_Model.dart';
import 'package:smartkit/FullApp/eStudy/Model/My_Course_Model.dart';
import 'package:smartkit/FullApp/eStudy/Model/Saved_Course_Model.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/eStudy/helper/StringsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/flutter_rating_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/eStudy/Payment/PaymentMethodActivityMobile.dart';

class CourseDetailActivityMobile extends StatefulWidget {
  int id;
  String type;

  CourseDetailActivityMobile({Key key, this.title, this.id, this.type})
      : super(key: key);
  final String title;

  @override
  _CourseDetailActivityMobileState createState() =>
      _CourseDetailActivityMobileState();
}

class _CourseDetailActivityMobileState extends State<CourseDetailActivityMobile>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  PageController _controller;
  bool descTextShowFlag = false;

  @override
  void initState() {
    // TODO: implement initState
    print("Contain" + widget.id.toString());
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget Lessons() {
    return ListView.builder(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: LessonsList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 10),
              decoration:
                  DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(5),
                leading: new CircleAvatar(
                    radius: 30,
                    child: ClipOval(
                        child: DesignConfig.DisplayCourseImage(
                            LessonsList[index].image, 100.0, 100.0))),
                title: new Text(LessonsList[index].lessonsName,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorsRes.introTitlecolor,
                    )),
                subtitle: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Text(
                          LessonsList[index].lessonsDate +
                              " " +
                              LessonsList[index].lessonsTime,
                          style: TextStyle(
                              fontSize: 14, color: ColorsRes.lightgraycolor)),
                      SizedBox(height: 5),
                      Text(LessonsList[index].lessonsNumber,
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorsRes.lightgraycolor,
                          )),
                    ]),
                onTap: () {
                  setState(() {});
                },
              ));
        });
  }

  Widget Comment() {
    return widget.type == "allcourse"
        ? ListView.builder(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: AllCourseList[1].commentList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Expanded(
                          flex: 1,
                          child: Text(
                            AllCourseList[widget.id]
                                .commentList[index]
                                .UserName,
                            style: TextStyle(
                                fontSize: 18, color: ColorsRes.introTitlecolor),
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(height: 5),
                      Container(
                          alignment: Alignment.topRight,
                          child: Text(
                            AllCourseList[widget.id]
                                .commentList[index]
                                .CommentDate,
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorsRes.appcolor,
                            ),
                            textAlign: TextAlign.end,
                          )),
                    ]),
                subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      DesignConfig.DisplayCommentRattingAllCourse(
                          AllCourseList[widget.id]
                              .commentList[index]
                              .CommentRateing,
                          true,
                          false),
                      SizedBox(height: 5),
                      Text(AllCourseList[widget.id].commentList[index].Comment,
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorsRes.lightgraycolor,
                          )),
                      SizedBox(height: 10),
                      Divider(
                        height: 5,
                        thickness: 1,
                      )
                    ]),
                onTap: () {
                  setState(() {});
                },
              );
            })
        : widget.type == "mycourse"
            ? ListView.builder(
                padding: EdgeInsets.only(bottom: 10, top: 10),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: MyCourseList[widget.id].commentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding: EdgeInsets.all(5),
                    title: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 5),
                          Expanded(
                              flex: 1,
                              child: Text(
                                MyCourseList[widget.id]
                                    .commentList[index]
                                    .UserName,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: ColorsRes.introTitlecolor),
                                textAlign: TextAlign.left,
                              )),
                          SizedBox(height: 5),
                          Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                MyCourseList[widget.id]
                                    .commentList[index]
                                    .CommentDate,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: ColorsRes.appcolor,
                                ),
                                textAlign: TextAlign.end,
                              )),
                        ]),
                    subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 5),
                          DesignConfig.DisplayCommentRattingMyCourse(
                              MyCourseList[widget.id]
                                  .commentList[index]
                                  .CommentRateing,
                              true,
                              false),
                          SizedBox(height: 5),
                          Text(
                              MyCourseList[widget.id]
                                  .commentList[index]
                                  .Comment,
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorsRes.lightgraycolor,
                              )),
                          SizedBox(height: 10),
                          Divider(
                            height: 5,
                            thickness: 1,
                          )
                        ]),
                    onTap: () {
                      setState(() {});
                    },
                  );
                })
            : widget.type == "savecourse"
                ? ListView.builder(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: SavedCourseList[widget.id].commentList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 5),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    SavedCourseList[widget.id]
                                        .commentList[index]
                                        .UserName,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: ColorsRes.introTitlecolor),
                                    textAlign: TextAlign.left,
                                  )),
                              SizedBox(height: 5),
                              Container(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    SavedCourseList[widget.id]
                                        .commentList[index]
                                        .CommentDate,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: ColorsRes.appcolor,
                                    ),
                                    textAlign: TextAlign.end,
                                  )),
                            ]),
                        subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 5),
                              DesignConfig.DisplayCommentRattingSaveCourse(
                                  SavedCourseList[widget.id]
                                      .commentList[index]
                                      .CommentRateing,
                                  true,
                                  false),
                              SizedBox(height: 5),
                              Text(
                                  SavedCourseList[widget.id]
                                      .commentList[index]
                                      .Comment,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorsRes.lightgraycolor,
                                  )),
                              SizedBox(height: 10),
                              Divider(
                                height: 5,
                                thickness: 1,
                              )
                            ]),
                        onTap: () {
                          setState(() {});
                        },
                      );
                    })
                : Container();
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(colors: [
          ColorsRes.secondgradientcolor,
          ColorsRes.firstgradientcolor,
        ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsRes.bgcolor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              systemOverlayStyle: SystemUiOverlayStyle.light,
              shadowColor: Colors.transparent,
              snap: false,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "",
                  style:
                      TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
                ), //Text
                background: Stack(children: [
                  PageView.builder(
                    controller: _controller,
                    itemCount: widget.type == "allcourse"
                        ? AllCourseList[widget.id].imageList.length
                        : widget.type == "mycourse"
                            ? MyCourseList[widget.id].imageList.length
                            : widget.type == "savecourse"
                                ? SavedCourseList[widget.id].imageList.length
                                : "",
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Container(
                          decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.type == "allcourse"
                              ? AllCourseList[widget.id].imageList[i].image
                              : widget.type == "mycourse"
                                  ? MyCourseList[widget.id].imageList[i].image
                                  : widget.type == "savecourse"
                                      ? SavedCourseList[widget.id]
                                          .imageList[i]
                                          .image
                                      : ""),
                          fit: BoxFit.fill,
                        ),
                      ));
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 20,
                        top: MediaQuery.of(context).size.height * .25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.type == "allcourse"
                            ? AllCourseList[widget.id].imageList.length
                            : widget.type == "mycourse"
                                ? MyCourseList[widget.id].imageList.length
                                : widget.type == "savecourse"
                                    ? SavedCourseList[widget.id]
                                        .imageList
                                        .length
                                    : "",
                        (index) => buildDot(index, context),
                      ),
                    ),
                  )
                ]), //Images.network
              ), //FlexibleSpaceBar
              expandedHeight: MediaQuery.of(context).size.height * .3,
              backgroundColor: ColorsRes.bgcolor,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: ColorsRes.black),
                tooltip: 'Back',
                onPressed: () {
                  Navigator.pop(context);
                },
              ), //IconButton
            ), //SliverAppBar
            SliverList(
                delegate: SliverChildListDelegate([
              widget.type == "allcourse"
                  ? Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsetsDirectional.only(end: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        RatingBarIndicator(
                                          rating: double.parse(
                                              AllCourseList[widget.id]
                                                  .CourseRating),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: 14,
                                          direction: Axis.horizontal,
                                        ),
                                        Text(
                                            AllCourseList[widget.id]
                                                .CourseRating,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color:
                                                    ColorsRes.lightgraycolor))
                                      ]),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            ColorsRes.secondgradientcolor,
                                            ColorsRes.firstgradientcolor,
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      "\tLIFESTYLE \t",
                                      style: TextStyle(
                                          color: ColorsRes.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(AllCourseList[widget.id].CourseName,
                                style: TextStyle(
                                    color: ColorsRes.introTitlecolor,
                                    fontSize: 22)),
                            Text(AllCourseList[widget.id].CourseSpeker,
                                style: TextStyle(
                                    color: ColorsRes.introMessagecolor,
                                    fontSize: 14)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(AllCourseList[widget.id].CoursePrice,
                                    style: TextStyle(
                                        color: ColorsRes.appcolor,
                                        fontSize: 26)),
                                SizedBox(width: 10),
                                Text(AllCourseList[widget.id].CourseDiscount,
                                    style: TextStyle(
                                        color: ColorsRes.introMessagecolor,
                                        fontSize: 18))
                              ],
                            ),
                            SizedBox(height: 10),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              PaymentMethodActivityMobile()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          ColorsRes.secondgradientcolor,
                                          ColorsRes.firstgradientcolor,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    StringsRes.By_Now_lb,
                                    style: TextStyle(
                                        color: ColorsRes.white, fontSize: 20),
                                  ),
                                )),
                            Text(StringsRes.Courses_Details_lb,
                                style: TextStyle(
                                    color: ColorsRes.appcolor, fontSize: 18)),
                            Text(AllCourseList[widget.id].CourseDescription,
                                maxLines: descTextShowFlag ? null : 5,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: ColorsRes.introTitlecolor,
                                    fontSize: 14)),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  descTextShowFlag = !descTextShowFlag;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  descTextShowFlag
                                      ? Text(
                                          StringsRes.Read_less_lb,
                                          style: TextStyle(
                                              color: ColorsRes.introTitlecolor,
                                              fontSize: 14),
                                        )
                                      : Text(StringsRes.Read_more_lb,
                                          style: TextStyle(
                                            color: ColorsRes.introTitlecolor,
                                            fontSize: 14,
                                          ))
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(
                              height: 5,
                              thickness: 1,
                            ),
                            Lessons(),
                            SizedBox(height: 10),
                            Divider(height: 5, thickness: 1),
                            SizedBox(height: 10),
                            Text(StringsRes.Courses_Reviwes_lb,
                                style: TextStyle(
                                    color: ColorsRes.appcolor, fontSize: 18)),
                            SizedBox(height: 10),
                            Divider(height: 5, thickness: 1),
                            SizedBox(height: 10),
                            Comment(),
                          ]))
                  : widget.type == "mycourse"
                      ? Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsetsDirectional.only(end: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            RatingBarIndicator(
                                              rating: double.parse(
                                                  MyCourseList[widget.id]
                                                      .CourseRating),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: 14,
                                              direction: Axis.horizontal,
                                            ),
                                            Text(
                                                MyCourseList[widget.id]
                                                    .CourseRating,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: ColorsRes
                                                        .lightgraycolor))
                                          ]),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              colors: [
                                                ColorsRes.secondgradientcolor,
                                                ColorsRes.firstgradientcolor,
                                              ],
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          "\tLIFESTYLE \t",
                                          style: TextStyle(
                                              color: ColorsRes.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(MyCourseList[widget.id].CourseName,
                                    style: TextStyle(
                                        color: ColorsRes.introTitlecolor,
                                        fontSize: 22)),
                                Text(MyCourseList[widget.id].CourseSpeker,
                                    style: TextStyle(
                                        color: ColorsRes.introMessagecolor,
                                        fontSize: 14)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(MyCourseList[widget.id].CoursePrice,
                                        style: TextStyle(
                                            color: ColorsRes.appcolor,
                                            fontSize: 26)),
                                    SizedBox(width: 10),
                                    Text(MyCourseList[widget.id].CourseDiscount,
                                        style: TextStyle(
                                            color: ColorsRes.introMessagecolor,
                                            fontSize: 18))
                                  ],
                                ),
                                SizedBox(height: 10),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  PaymentMethodActivityMobile()));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [
                                              ColorsRes.secondgradientcolor,
                                              ColorsRes.firstgradientcolor,
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        StringsRes.By_Now_lb,
                                        style: TextStyle(
                                            color: ColorsRes.white,
                                            fontSize: 20),
                                      ),
                                    )),
                                Text(StringsRes.Courses_Details_lb,
                                    style: TextStyle(
                                        color: ColorsRes.appcolor,
                                        fontSize: 18)),
                                Text(MyCourseList[widget.id].CourseDescription,
                                    maxLines: descTextShowFlag ? null : 5,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: ColorsRes.introTitlecolor,
                                        fontSize: 14)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      descTextShowFlag = !descTextShowFlag;
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      descTextShowFlag
                                          ? Text(
                                              StringsRes.Read_less_lb,
                                              style: TextStyle(
                                                  color:
                                                      ColorsRes.introTitlecolor,
                                                  fontSize: 14),
                                            )
                                          : Text(StringsRes.Read_more_lb,
                                              style: TextStyle(
                                                color:
                                                    ColorsRes.introTitlecolor,
                                                fontSize: 14,
                                              ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  height: 5,
                                  thickness: 1,
                                ),
                                Lessons(),
                                SizedBox(height: 10),
                                Divider(height: 5, thickness: 1),
                                SizedBox(height: 10),
                                Text(StringsRes.Courses_Reviwes_lb,
                                    style: TextStyle(
                                        color: ColorsRes.appcolor,
                                        fontSize: 18)),
                                SizedBox(height: 10),
                                Divider(height: 5, thickness: 1),
                                SizedBox(height: 10),
                                Comment(),
                              ]))
                      : widget.type == "savecourse"
                          ? Padding(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          end: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                RatingBarIndicator(
                                                  rating: double.parse(
                                                      SavedCourseList[widget.id]
                                                          .CourseRating),
                                                  itemBuilder:
                                                      (context, index) => Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize: 14,
                                                  direction: Axis.horizontal,
                                                ),
                                                Text(
                                                    SavedCourseList[widget.id]
                                                        .CourseRating,
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: ColorsRes
                                                            .lightgraycolor))
                                              ]),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                  colors: [
                                                    ColorsRes
                                                        .secondgradientcolor,
                                                    ColorsRes
                                                        .firstgradientcolor,
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "\tLIFESTYLE \t",
                                              style: TextStyle(
                                                  color: ColorsRes.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(SavedCourseList[widget.id].CourseName,
                                        style: TextStyle(
                                            color: ColorsRes.introTitlecolor,
                                            fontSize: 22)),
                                    Text(
                                        SavedCourseList[widget.id].CourseSpeker,
                                        style: TextStyle(
                                            color: ColorsRes.introMessagecolor,
                                            fontSize: 14)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            SavedCourseList[widget.id]
                                                .CoursePrice,
                                            style: TextStyle(
                                                color: ColorsRes.appcolor,
                                                fontSize: 26)),
                                        SizedBox(width: 10),
                                        Text(
                                            SavedCourseList[widget.id]
                                                .CourseDiscount,
                                            style: TextStyle(
                                                color:
                                                    ColorsRes.introMessagecolor,
                                                fontSize: 18))
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      PaymentMethodActivityMobile()));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  ColorsRes.secondgradientcolor,
                                                  ColorsRes.firstgradientcolor,
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            StringsRes.By_Now_lb,
                                            style: TextStyle(
                                                color: ColorsRes.white,
                                                fontSize: 20),
                                          ),
                                        )),
                                    Text(StringsRes.Courses_Details_lb,
                                        style: TextStyle(
                                            color: ColorsRes.appcolor,
                                            fontSize: 18)),
                                    Text(
                                        SavedCourseList[widget.id]
                                            .CourseDescription,
                                        maxLines: descTextShowFlag ? null : 5,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: ColorsRes.introTitlecolor,
                                            fontSize: 14)),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          descTextShowFlag = !descTextShowFlag;
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          descTextShowFlag
                                              ? Text(
                                                  StringsRes.Read_less_lb,
                                                  style: TextStyle(
                                                      color: ColorsRes
                                                          .introTitlecolor,
                                                      fontSize: 14),
                                                )
                                              : Text(StringsRes.Read_more_lb,
                                                  style: TextStyle(
                                                    color: ColorsRes
                                                        .introTitlecolor,
                                                    fontSize: 14,
                                                  ))
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Divider(
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Lessons(),
                                    SizedBox(height: 10),
                                    Divider(height: 5, thickness: 1),
                                    SizedBox(height: 10),
                                    Text(StringsRes.Courses_Reviwes_lb,
                                        style: TextStyle(
                                            color: ColorsRes.appcolor,
                                            fontSize: 18)),
                                    SizedBox(height: 10),
                                    Divider(height: 5, thickness: 1),
                                    SizedBox(height: 10),
                                    Comment(),
                                  ]))
                          : Container()
            ]))
          ], //<Widget>[]
        ));
  }
}
