import 'package:flutter/material.dart';
import 'package:smartkit/UIScreens/Login/WRLogin2/signIn.dart';

import 'Background.dart';
import 'CustomInputFeild.dart';

class WrSignUp extends StatefulWidget {
  @override
  _WrSignUpState createState() => _WrSignUpState();
}

class _WrSignUpState extends State<WrSignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      size: size,
      child: SafeArea(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Icon(
              //   Icons.dehaze,
              //   size: 35,
              //   color: Colors.white,
              // ),
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "Create\nAccount",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 40),
              CustomInputField(
                hint: "Name",
                size: size,
                prefixIcon: Icons.person_outline,
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Color(0xff8E4E81),
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.all(15),
                        primary: Color(0xff8E4E81),
                      ),
                      onPressed: () {},
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
                      builder: (context) => SignIn(),
                    ),
                  );
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Color(0xff8E4E81),
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
