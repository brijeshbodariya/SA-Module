import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/UIScreens/Login/WRLogin2/singup.dart';

import 'Background.dart';
import 'CustomInputFeild.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      size: size,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // GestureDetector(
              //   onTap: () => Navigator.pop(context),
              //   child: Icon(
              //     CupertinoIcons.back,
              //     size: 35,
              //     color: Colors.white,
              //   ),
              // ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Welcome\nBack",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 60),
              CustomInputField(
                hint: "Email",
                size: size,
                prefixIcon: Icons.email,
              ),
              CustomInputField(
                hint: "Password",
                size: size,
                prefixIcon: Icons.lock,
                obscure: true,
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignIn(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "forgot password?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Sign In",
                    style: TextStyle(
                      color: Color(0xff8E4E81),
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        primary: Color(0xff8E4E81),
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WrSignUp(),
                    ),
                  );
                },
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Color(0xff8E4E81),
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
