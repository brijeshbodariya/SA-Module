import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/model/Comment.dart';

class CommentListMobile extends StatefulWidget {
  @override
  _CommentListStateMobile createState() => _CommentListStateMobile();
}

class _CommentListStateMobile extends State<CommentListMobile> {
  List<Comment> commentlist;
  @override
  void initState() {
    super.initState();
    commentlist = [];
    setCommentList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesignConfig.setAppbar(StringsRes.comments),
      body: commentWidget(),
    );
  }

  Widget commentWidget() {
    return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        itemBuilder: (context, index) {
          Comment comment = commentlist[index];
          return buttonWithShadow(comment);
        },
        separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
        itemCount: commentlist.length);
  }

  Widget buttonWithShadow(Comment comment) {
    return IntrinsicHeight(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ColorsRes.white,
              boxShadow: [
                BoxShadow(
                  color: ColorsRes.appcolor.withOpacity(0.3),
                  offset: Offset(4, 4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: ColorsRes.white,
              boxShadow: [
                BoxShadow(
                  color: ColorsRes.btnlightshadow,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                      radius: 30,
                      child: ClipOval(
                        child: CachedNetworkImage(
                            imageUrl: comment.userimage,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png"),
                            errorWidget: (context, url, error) => CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/placeholder.png")),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(comment.username,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsRes.black,
                                ))),
                        Row(children: [
                          Icon(
                            Icons.alarm,
                            color: ColorsRes.grey,
                            size: 15,
                          ),
                          Text(
                            "\t${comment.datetime}",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(comment.comment)
              ],
            ),
          ),
        ],
      ),
    );
  }

  setCommentList() {
    commentlist.add(new Comment(
        id: 1,
        username: "Wrteam01",
        datetime: "1 hour ago",
        userimage: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg",
        comment: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 2,
        username: "Wrteam02",
        userimage: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg",
        datetime: "2 hour ago",
        comment: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 3,
        username: "Wrteam03",
        datetime: "3 hour ago",
        userimage: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg",
        comment: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 4,
        username: "Wrteam04",
        datetime: "1 day ago",
        userimage: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg",
        comment: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 5,
        username: "Wrteam05",
        datetime: "5 days ago",
        userimage: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg",
        comment: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));

    commentlist.add(new Comment(
        id: 6,
        username: "Wrteam06",
        datetime: "1 week ago",
        userimage: "https://s.abcnews.com/images/US/hanna-swimmer-mo_hpMain_20200725-163152_2_4x3t_384.jpg",
        comment: "Hurricane Hanna battered southern Texas with sustained winds of 75 mph and continued to deliver heavy rain and flash flooding as it moved inland late Saturday."));
  }
}
