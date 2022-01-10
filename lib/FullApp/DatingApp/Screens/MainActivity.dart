import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/DiscoverActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/FavoriteActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/HomeActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/MessageActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/ProfileActivity.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class MainActivity extends StatefulWidget {
  int id;
  MainActivity({Key key, this.id}) : super(key: key);

  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  bool clickedCentreFAB = false;
  int selectedIndex = 0;
  String text = "Home";

  ChoiceChip choiceChip;
  List<Widget> fragments;

  @override
  void initState() {
    fragments = [
      HomeActivity(),
      FavoriteActivity(),
      MessageActivity(),
      ProfileActivity(),
    ];
    widget.id!=null?selectedIndex = widget.id: selectedIndex = 0;
    super.initState();
  }

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
      text = buttonText;
    });
  }


  /*showFilter() {
    RangeValues valuesDistance = RangeValues(1, 100);
    RangeLabels labelsDistance = RangeLabels('1', "500");
    RangeValues valuesAge = RangeValues(18, 35);
    RangeLabels labelsAge = RangeLabels('1', "100");

    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.9),
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.close,
                                color: ColorsRes.darkColor,
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            Spacer(),
                            Text(
                              'Filter',
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                  color: ColorsRes.darkColor, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'Clear',
                                style: TextStyle(color: ColorsRes.grayColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(height: 2,color: ColorsRes.darkColor,),
                      SizedBox(height: 20),
                      ListTile(contentPadding: EdgeInsets.all(0),
                        title: Text("Location",
                          style: TextStyle(
                            fontSize: 20,
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text("Toronto City, Ontario CA",
                          style: TextStyle(
                              fontSize: 18,
                              color: ColorsRes.darkColor,
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: ColorsRes.darkColor
                        ),
                        onTap: () {},
                      ),
                      Text('Distance',style: TextStyle(fontSize: 18,
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold)),
                      Align(alignment: Alignment.topRight,
                        child: Text(startKm.toString()+"km" ' - ' + endKm.toString()+"km",style: TextStyle(fontSize: 16,
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold)),
                      ),
                      RangeSlider(
                          divisions: 5,
                          activeColor: ColorsRes.gradientTwo,
                          inactiveColor: ColorsRes.grayColor.withOpacity(0.3),
                          min: 1,
                          max: 500,
                          values: valuesDistance,
                          labels: labelsDistance,
                          onChanged: (value) {
                            print("START: ${value.start}, End: ${value.end}");
                            setState(() {
                              valuesDistance = value;
                              startKm = value.start.toInt();
                              endKm = value.end.toInt();
                              labelsDistance = RangeLabels(
                                  "${value.start.toInt().toString()}km",
                                  "${value.end.toInt().toString()}km");
                            });
                          }),
                      Text('Age',style: TextStyle(fontSize: 18,
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold)),
                      Align(alignment: Alignment.topRight,
                        child: Text(startAge.toString()+ ' - ' + endAge.toString()+"Years",style: TextStyle(fontSize: 16,
                            color: ColorsRes.darkColor,
                            fontWeight: FontWeight.bold)),
                      ),
                      RangeSlider(
                          divisions: 5,
                          activeColor: ColorsRes.gradientTwo,
                          inactiveColor: ColorsRes.grayColor.withOpacity(0.3),
                          min: 1,
                          max: 100,
                          values: valuesAge,
                          labels: labelsAge,
                          onChanged: (value) {
                            print("START: ${value.start}, End: ${value.end}");
                            setState(() {
                              valuesAge = value;
                              startAge = value.start.toInt();
                              endAge = value.end.toInt();
                              labelsAge = RangeLabels(
                                  "${value.start.toInt().toString()}Years",
                                  "${value.end.toInt().toString()}Years");
                            });
                          }),
                      Text(StringsRes.interestedInText,style: TextStyle(fontSize: 18,
                          color: ColorsRes.darkColor,
                          fontWeight: FontWeight.bold)),
                      SizedBox(height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: attList.length,
                          itemBuilder: (context, index) {
                            return attList[index]!=StringsRes.maleText?GestureDetector(onTap: (){print(attList[index].toString());},
                              child: Container(width: 100,padding: EdgeInsets.all(5),margin: EdgeInsets.only(left: 10,top: 10),
                                  decoration:  DesignConfig.boxDecorationBorderButtonColor(ColorsRes.darkColor, 50),
                                  child: Align(alignment: Alignment.center,
                                    child: Text(attList[index].toString(), style: TextStyle(color: ColorsRes.darkColor),),)),
                            ):
                            Container(width: 100,padding: EdgeInsets.all(5),margin: EdgeInsets.only(left: 10,top: 10),
                              decoration: DesignConfig.boxDecorationButtonColor(ColorsRes.gradientOne,ColorsRes.gradientTwo,50),
                              child: Align(alignment: Alignment.center,
                                child: Text(attList[index].toString(),style: TextStyle(color: ColorsRes.white)),),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pop(context);
                        },
                        child: Container(decoration: DesignConfig.boxDecorationButton(ColorsRes.gradientOne,ColorsRes.gradientTwo),
                            margin: EdgeInsets.only(right: 20, left: 20),
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            alignment: Alignment.center,
                            child: Text(StringsRes.doneText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: ColorsRes.white,
                                ))),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  ),
                );
              });
        });
  }*/



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => MyHomePage()));
      },
      child: Scaffold(
        body: fragments[selectedIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              //showFilter();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DiscoverActivity()));
            });
          },
          tooltip: "Fab",
          child: Container(
            width: 60,
            height: 60,
            child: Icon(Icons.add),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [ColorsRes.gradientOne, ColorsRes.gradientTwo])),
          ),
          elevation: 4.0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(padding: EdgeInsets.only(bottom: 12.0),
            margin: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    updateTabSelection(0, "Home");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                    selectedIndex == 0
                        ? "assets/datingapp/home_active.svg"
                        : "assets/datingapp/home_deactive.svg",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(1, "Favorite");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                     selectedIndex == 1
                         ? "assets/datingapp/fav_active.svg"
                         : "assets/datingapp/fav_deactive.svg",
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(2, "Chat");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                     selectedIndex == 2
                         ? "assets/datingapp/chat_active.svg"
                         : "assets/datingapp/chat_deactive.svg",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(3, "Profile");
                  },
                  iconSize: 27.0,
                  icon: SvgPicture.asset(
                     selectedIndex == 3
                         ? "assets/datingapp/profile_active.svg"
                         : "assets/datingapp/profile_deactive.svg",
                  ),
                ),
              ],
            ),
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}