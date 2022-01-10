import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';

class DesignConfig{
  static BoxDecoration boxDecorationBackground(){
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        ColorsRes.gradientTwo,
        ColorsRes.gradientOne,
      ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
    );
  }

  static BoxDecoration boxDecorationButton(Color color1, Color color2){
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        color1,
        color2,
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      borderRadius: BorderRadius.circular(10),
    );
  }

  static BoxDecoration boxDecorationContainer(Color color, double radius) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecorationBorderButtonColor(
      Color color, double sizes) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(sizes),
        border: Border.all(color: color, width: 1));
  }

  static BoxDecoration boxDecorationButtonColor(
      Color color1, Color color2, double sizes) {
    return BoxDecoration(
      gradient: LinearGradient(colors: [
        color1,
        color2,
      ], begin: Alignment.centerLeft, end: Alignment.centerRight),
      borderRadius: BorderRadius.circular(sizes),
    );
  }

  static Widget displayCourseImage(String image, double height, double width) {
    return Image.asset(
      image,
      width: width,
      height: height,
      fit: BoxFit.fill,
    );
  }
  static Widget showFilter(BuildContext context) {
    int startKm = 1;
    int endKm = 100;
    int startAge = 18;
    int endAge = 35;
    List<String> attList = ['Men', 'Women', 'Other'];
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
  }

}