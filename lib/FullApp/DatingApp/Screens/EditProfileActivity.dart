import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/LoginActivity.dart';
import 'package:smartkit/FullApp/DatingApp/Screens/RegistrationSuccessfullActivity.dart';
import 'package:smartkit/FullApp/DatingApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/DatingApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/DatingApp/helper/StringsRes.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitHome.dart';

class EditProfileActivity extends StatefulWidget {
  EditProfileActivity({Key key}) : super(key: key);

  @override
  _EditProfileActivityState createState() => _EditProfileActivityState();
}

class _EditProfileActivityState extends State<EditProfileActivity> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return navigationPage();
      },
      child: Scaffold(
        appBar: AppBar(shadowColor: Colors.transparent,backgroundColor: ColorsRes.backgroundColor,leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: ColorsRes.darkColor,), onPressed: (){ Navigator.pop(context);}, ), title: Text(
          StringsRes.profileText,textAlign: TextAlign.left,
          style: TextStyle(color: ColorsRes.darkColor, fontWeight: FontWeight.bold, fontSize: 20,),
        ),centerTitle: true, actions: [GestureDetector(onTap: (){Navigator.pop(context);},
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Center(
              child: Text(
                StringsRes.saveText,textAlign: TextAlign.left,
                style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.normal, fontSize: 18,),
              ),
            ),
          ),
        )],),
        body: Stack(
          children: <Widget>[
            Container(color: ColorsRes.backgroundColor,
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Stack(
                          children: [
                            // image set in circle
                            Container(alignment: Alignment.center,
                                child: CircleAvatar(radius: 50, backgroundColor: ColorsRes.backgroundColor, child : Container(child: ClipOval(child: Image.asset("assets/datingapp/profilepic.png", width: 135, height: 135, fit: BoxFit.fill,)),
                                  ),
                                )
                            ),
                            //edit image
                            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01, left: MediaQuery.of(context).size.width * .55),
                                child: FloatingActionButton(mini: true,backgroundColor: ColorsRes.gradientTwo,
                                  child: Icon(Icons.camera_alt),
                                  onPressed: () async {
                                  },
                                )
                            ),
                          ]
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.usernameText,textAlign: TextAlign.left,
                            style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.normal, fontSize: 18,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                              style: TextStyle(color: ColorsRes.darkColor, fontSize: 15, fontWeight: FontWeight.w500),
                              cursorColor: ColorsRes.darkColor,
                              decoration: InputDecoration(
                                hintText: StringsRes.enterUsernameText,
                                hintStyle: Theme.of(context).textTheme.subtitle2.merge(
                                    TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: ColorsRes.darkColor)),
                                //border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.emailText,textAlign: TextAlign.left,
                            style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.normal, fontSize: 18,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.darkColor, fontSize: 15, fontWeight: FontWeight.w500),
                          cursorColor: ColorsRes.darkColor,
                          decoration: InputDecoration(
                            hintText: StringsRes.enterEmailText,
                            hintStyle: Theme.of(context).textTheme.subtitle2.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: ColorsRes.darkColor)),
                            //border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.phoneNumberText,textAlign: TextAlign.left,
                            style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.normal, fontSize: 18,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.darkColor, fontSize: 15, fontWeight: FontWeight.w500),
                          cursorColor: ColorsRes.darkColor,
                          decoration: InputDecoration(
                            hintText: StringsRes.enterPhoneNumberText,
                            hintStyle: Theme.of(context).textTheme.subtitle2.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: ColorsRes.darkColor)),
                            //border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.locationText,textAlign: TextAlign.left,
                            style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.normal, fontSize: 18,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.darkColor, fontSize: 15, fontWeight: FontWeight.w500),
                          cursorColor: ColorsRes.darkColor,
                          decoration: InputDecoration(
                            hintText: StringsRes.enterLocationText,
                            hintStyle: Theme.of(context).textTheme.subtitle2.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: ColorsRes.darkColor)),
                            //border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.streetAddress,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.dateOfBirthText,textAlign: TextAlign.left,
                            style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.normal, fontSize: 18,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.darkColor, fontSize: 15, fontWeight: FontWeight.w500),
                          cursorColor: ColorsRes.darkColor,
                          decoration: InputDecoration(
                            hintText: StringsRes.dateOfBirthText,
                            hintStyle: Theme.of(context).textTheme.subtitle2.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: ColorsRes.darkColor)),
                            //border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Text(
                            StringsRes.aboutText,textAlign: TextAlign.left,
                            style: TextStyle(color: ColorsRes.gradientTwo, fontWeight: FontWeight.normal, fontSize: 18,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextFormField(
                          style: TextStyle(color: ColorsRes.darkColor, fontSize: 15, fontWeight: FontWeight.w500),
                          cursorColor: ColorsRes.darkColor,
                          decoration: InputDecoration(
                            hintText: StringsRes.enterAboutText,
                            hintStyle: Theme.of(context).textTheme.subtitle2.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    color: ColorsRes.darkColor)),
                            //border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationSuccessfullActivity(),
                            ),
                          );
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
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> navigationPage() async {
    Navigator.pop(context);
  }
}
