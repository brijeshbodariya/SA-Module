import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagString.dart';
import 'package:smartkit/FullApp/Grobag/mobile/Screen/GrobagMobInputMobile.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';

import 'GrobagHomeMobile.dart';

class GrobagSignupMobile extends StatefulWidget {
  @override
  _GrobagSignupMobileState createState() => _GrobagSignupMobileState();
}

class _GrobagSignupMobileState extends State<GrobagSignupMobile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  TextEditingController conPassWordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _showNPassword = false, _showCPassword = false;
  String countrycode;
  AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GrobagAppbar(
        title: '',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Register,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: fontColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //applebtn(),
                  //Spacer(),
                  googlebtn()],
              ),
              Form(
                  key: formKey,
                  child: new Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              hintText: Email,
                              suffixIcon: Icon(
                                Icons.email_outlined,
                                color: primary,
                              )),
                          onChanged: (v) => setState(() {}),
                        ),
                      ),
                      TextFormField(
                        controller: fNameController,
                        keyboardType: TextInputType.text,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            hintText: First,
                            suffixIcon: Icon(
                              Icons.person_outline,
                              color: primary,
                            )),
                        onChanged: (v) => setState(() {}),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: lNameController,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              hintText: Last,
                              suffixIcon: Icon(
                                Icons.person_outline,
                                color: primary,
                              )),
                          onChanged: (v) => setState(() {}),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            hintText: Mobile,
                            prefixIcon: Container(
                              width: 90,
                              child: setCountryCode(),
                            ),
                            suffixIcon: Icon(
                              Icons.call_outlined,
                              color: primary,
                            ),
                          ),
                          onChanged: (v) => setState(() {}),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: passWordController,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: new InputDecoration(
                              hintText: Password,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _showNPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showNPassword = !_showNPassword;
                                  });
                                },
                              )),
                          obscureText: !_showNPassword,
                          onChanged: (v) => setState(() {}),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: conPassWordController,
                          keyboardType: TextInputType.text,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: new InputDecoration(
                              hintText: ConPassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _showCPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _showCPassword = !_showCPassword;
                                  });
                                },
                              )),
                          obscureText: !_showCPassword,
                          onChanged: (v) => setState(() {}),
                        ),
                      ),
                    ],
                  )),
              createbtn()
            ],
          ),
        ),
      ),
    );
  }

  setCountryCode() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height * 0.9;
    return CountryCodePicker(
        showCountryOnly: false,
        searchDecoration: InputDecoration(
          hintText: CountryCodeLbl,
          hintStyle: TextStyle(color: fontColor),
          fillColor: fontColor,
        ),
        showOnlyCountryWhenClosed: false,
        initialSelection: 'IN',
        dialogSize: Size(width, height),
        alignLeft: true,
        // textStyle:TextStyle(color: fontColor,),
        onChanged: (CountryCode countryCode) {
          countrycode = countryCode.toString().replaceFirst("+", "");
        },
        onInit: (code) {
          countrycode = code.toString().replaceFirst("+", "");
        });
  }

  googlebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 48,
        decoration: new BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.network(
              'https://smartkit.wrteam.in/smartkit/grobag/google.svg'),
        ),
      ),
      onPressed: () async {
        await authServices.signWithGoogle(
            context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHomeMobile(),
          ),
        );
        Toast.show("LogIn SuccessFully", context,
            backgroundColor: ColorsRes.black,
            textColor: ColorsRes.white,
            duration: 5);
      },
    );
  }

  Widget applebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        width: MediaQuery.of(context).size.width * 0.42,
        height: 48,
        decoration: new BoxDecoration(
          color: fontColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.network(
              'https://smartkit.wrteam.in/smartkit/grobag/apple.svg'),
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GrobagHomeMobile(),
          ),
        );
      },
    );
  }

  createbtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        width: double.infinity,
        height: 48,
        decoration: new BoxDecoration(
          color: Color(0xff00b65f),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Color(0x29000000),
                offset: Offset(0, 0),
                blurRadius: 3,
                spreadRadius: 0)
          ],
        ),
        child: Center(
          child: Text("Create Account",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () async {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => GrobagMobInputMobile()));
        // if (formKey.currentState.validate() &&
        //     phoneController.text.isNotEmpty &&
        //     fNameController.text.isNotEmpty &&
        //     lNameController.text.isNotEmpty &&
        //     passWordController.text == conPassWordController.text) {
        //   try {
        //     UserCredential appUser = await authServices.authCreateUser(
        //         emailInput: emailController.text,
        //         passwordInput: passWordController.text,
        //         context: context);
        //     print("appUser --->$appUser");
        //     if (appUser != null) {
        //       Navigator.push(
        //           context,
        //           new MaterialPageRoute(
        //               builder: (context) => GrobagMobInputMobile()));
        //     }
        //   } catch (e) {
        //     Toast.show(e.message.toString(), context,
        //         backgroundColor: ColorsRes.black,
        //         textColor: ColorsRes.white,
        //         duration: 5);
        //     print("error --->$e");
        //   }
        // }else if(passWordController.text != conPassWordController.text){
        //   Toast.show("confirm password", context,
        //       backgroundColor: ColorsRes.black,
        //       textColor: ColorsRes.white,
        //       duration: 5);
        // }
        // else {
        //   Toast.show("Please fill all field", context,
        //       backgroundColor: ColorsRes.black,
        //       textColor: ColorsRes.white,
        //       duration: 5);
        // }
      },
    );
  }
}
