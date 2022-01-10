import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/eStudy/Model/Lessons_Model.dart';
import 'package:smartkit/FullApp/eStudy/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/eStudy/helper/DesignConfig.dart';

import 'LessonDetails.dart';

class SubLesson extends StatefulWidget {
  final int id;
  SubLesson({Key key, this.id}) : super(key: key);

  @override
  _SubLessonState createState() => _SubLessonState();
}

class _SubLessonState extends State<SubLesson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light, shadowColor: Colors.transparent,
            snap: false,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  "",
                  style: TextStyle(color: ColorsRes.introTitlecolor, fontSize: 28),
                ), //Text
                background: SvgPicture.network(
                  "https://smartkit.wrteam.in/smartkit/eStudy/topback.svg",
                  width: MediaQuery.of(context).size.width,
                  // fit: BoxFit.cover,
                ) //Images.network
                ), //FlexibleSpaceBar
            expandedHeight: 0,
            backgroundColor: ColorsRes.bgcolor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: ColorsRes.appcolor),
              tooltip: 'Back',
              onPressed: () {
                Navigator.pop(context);
                // setState(() {
                //   Lesson = 1;
                // });
              },
            ), //IconButton
          ), //SliverAppBar
          SliverList(
              delegate: SliverChildListDelegate([
            Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                leading: new CircleAvatar(radius: 30, child: ClipOval(child: CachedNetworkImage(imageUrl: LessonsList[widget.id].image, fit: BoxFit.fill, width: 100.0, height: 100.0))),
                title: new Text(LessonsList[widget.id].lessonsName, style: TextStyle(fontSize: 28, color: ColorsRes.introTitlecolor, fontWeight: FontWeight.bold)),
                subtitle: new Text(LessonsList[widget.id].lessonsNumber,
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorsRes.introTitlecolor,
                    )),
                onTap: () {
                  // setState(() {
                  //   Lesson = 3;
                  // });
                  print(widget.id);
                },
              ),
              Divider(
                height: 1,
                indent: 20,
                endIndent: 20,
              ),
              ListView.builder(
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 10),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: LessonsList[widget.id].LessonsContaint.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Container(
                        decoration: DesignConfig.boxDecorationContainer(ColorsRes.white, 10),
                        child: SvgPicture.network(LessonsList[widget.id].LessonsContaint[index].image),
                      ),
                      title: new Text(LessonsList[widget.id].LessonsContaint[index].lessonsContentName,
                          style: TextStyle(
                            fontSize: 15,
                            color: ColorsRes.introTitlecolor,
                          )),
                      subtitle: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        new Text(LessonsList[widget.id].LessonsContaint[index].lessonsSubTitle,
                            style: TextStyle(
                              fontSize: 15,
                              color: ColorsRes.introMessagecolor,
                            )),
                        Divider(
                          height: 5,
                          thickness: 1,
                        )
                      ]),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15, color: ColorsRes.radiobuttoncolor),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LessonDetails(
                              id: widget.id,
                              idvideo: index,
                            ),
                          ),
                        );
                        // setState(() {
                        //   Lesson = 3;
                        //   idvideo = index;
                        // }
                      },
                    );
                  }),
            ]),
          ]) //SliverChildBuildDelegate
              ),
          SliverPadding(padding: EdgeInsets.only(bottom: 90))
        ], //<Widget>[]
      ),
    );
  }
}
