import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartkit/FullApp/FoodMaster/desktop/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagAppbar.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagColor.dart';
import 'package:smartkit/FullApp/Grobag/Helper/GrobagString.dart';
import 'package:smartkit/FullApp/Grobag/mobile/Screen/GrobagHomeMobile.dart';
import 'package:smartkit/services/auth_service.dart';
import 'package:toast/toast.dart';

class GrobagEmailLoginMobile extends StatefulWidget {
  @override
  _GrobagEmailLoginMobileState createState() => _GrobagEmailLoginMobileState();
}

class _GrobagEmailLoginMobileState extends State<GrobagEmailLoginMobile> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  AuthServices authServices = AuthServices();
  bool _showNPassword = false;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                'Welcome back',
                style: TextStyle(color: fontLight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: new InputDecoration(
                      hintText: Password,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showNPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
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
              signinpbtn(),
              Center(child: Text('or')),
             // applebtn(),
              googlebtn()
            ],
          ),
        ),
      ),
    );
  }

  signinpbtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        width: double.infinity,
        height: 48,
        decoration: new BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Center(
          child: Text("Sign In",
              style: TextStyle(
                color: white,
              )),
        ),
      ),
      onPressed: () async {
        try {
          await authServices.authSignInUser(
              emailInput: emailController.text,
              passwordInput: passwordController.text,
              context: context);
          Toast.show("LogIn SuccessFully", context,
              backgroundColor: ColorsRes.black,
              textColor: ColorsRes.white,
              duration: 5);
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => GrobagHomeMobile()), (Route<dynamic> route) => false);
        } catch (e) {
          print("e-->$e");
          Toast.show(e.message.toString(), context,
              backgroundColor: ColorsRes.black,
              textColor: ColorsRes.white,
              duration: 5);
        }
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GrobagHome()));
      },
    );
  }

  googlebtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: new Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        height: 48,
        decoration: new BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/google.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign in with Google",
                  style: TextStyle(
                    color: fontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
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
      padding: EdgeInsets.symmetric(vertical: 15),
      child: new Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20, top: 30),
        height: 48,
        decoration: new BoxDecoration(
          color: fontColor,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 3, spreadRadius: 0)],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.network('https://smartkit.wrteam.in/smartkit/grobag/apple.svg'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("Sign in with apple",
                  style: TextStyle(
                    color: Color(0xfff8f9fb),
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GrobagHomeMobile()));
      },
    );
  }
}
