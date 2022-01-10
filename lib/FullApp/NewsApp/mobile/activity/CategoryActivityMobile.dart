import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/helper/new_dialog.dart';
import 'package:smartkit/FullApp/NewsApp/mobile/activity/MainActivityMobile.dart';
import 'package:smartkit/FullApp/NewsApp/model/Category.dart';
import 'package:smartkit/FullApp/NewsApp/model/Language.dart';

class CategoryActivityMobile extends StatefulWidget {
  @override
  _CategoryActivityStateMobile createState() => _CategoryActivityStateMobile();
}

class _CategoryActivityStateMobile extends State<CategoryActivityMobile> {
  List<Category> categorylist;
  List<Language> languagelist;
  int selectedlangid = 2;

  @override
  void initState() {
    super.initState();
    categorylist = [];
    languagelist = [];
    categorylist = setCategoryList();
    setLanguageList();

    new Future.delayed(Duration.zero, () {
      showLanguageDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DesignConfig.setAppbar(StringsRes.choosetopic),
        body: GridView.count(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: List.generate(categorylist.length, (index) {
              Category category = categorylist[index];
              return ButtonClickAnimation(
                  onTap: () {
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => MainActivityMobile()));
                  },
                  child: Column(
                    children: [
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(30.0),
                        width: double.maxFinite,
                        child: CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/${category.image}"),
                        decoration: new BoxDecoration(
                          color: ColorsRes.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            new BoxShadow(
                              color: ColorsRes.appcolor.withOpacity(0.5),
                              blurRadius: 5.0,
                            ),
                          ],
                        ),
                      )),
                      SizedBox(height: 8),
                      Text(
                        category.name,
                        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.blue, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ));
            })));
  }

  showLanguageDialog() {
    showNewDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: DesignConfig.setRoundedBorder(ColorsRes.white, 10, false),
            title: Text(StringsRes.selectlanguage),
            content: SingleChildScrollView(
              child: Column(
                children: List.generate(languagelist.length, (index) {
                  Language language = languagelist[index];
                  bool isselected = selectedlangid == language.id;
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedlangid = language.id;
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Row(children: [
                            Icon(Icons.brightness_1, color: ColorsRes.black),
                            SizedBox(width: 12),
                            Expanded(
                                child: Text(
                              language.name,
                              style: TextStyle(color: isselected ? ColorsRes.appcolor : ColorsRes.black, fontWeight: isselected ? FontWeight.bold : FontWeight.normal),
                            )),
                            SizedBox(width: 5),
                            if (isselected) Icon(Icons.check, color: ColorsRes.green),
                          ])));
                }),
              ),
            ),
          );
        });
  }

  List<Language> setLanguageList() {
    languagelist.add(new Language(id: 1, name: "Gujarati"));
    languagelist.add(new Language(id: 2, name: "English"));
    languagelist.add(new Language(id: 3, name: "Hindi"));
  }

  List<Category> setCategoryList() {
    List<Category> categorylist = [];
    categorylist.add(new Category(id: 1, name: "Sports", image: "sports.png"));
    categorylist.add(new Category(id: 2, name: "Entertainment", image: "entertainment.png"));
    categorylist.add(new Category(id: 3, name: "Politics", image: "political.png"));
    categorylist.add(new Category(id: 4, name: "Technology", image: "technology.png"));
    categorylist.add(new Category(id: 5, name: "Education", image: "education.png"));
    categorylist.add(new Category(id: 6, name: "Health", image: "helath.png"));
    categorylist.add(new Category(id: 7, name: "Science", image: "science.png"));
    categorylist.add(new Category(id: 8, name: "Economy", image: "economy.png"));
    return categorylist;
  }
}
