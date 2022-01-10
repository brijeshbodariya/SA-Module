import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Login_Simple extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login_Simple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // Add box decoration
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.deepOrange[400],
              Colors.deepOrange[300],
              Colors.pink[400],
              Colors.pink[600],
            ],
          ),
        ),
        child: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                CachedNetworkImage(
                  imageUrl: "https://smartkit.wrteam.in/smartkit/images/profile.png",
                  width: 100,
                  height: 70,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "User Name",
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      icon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: OutlineButton(
                        child: Container(margin: EdgeInsets.symmetric(vertical: 10), child: new Text("Login", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white))),
                        onPressed: () {
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginRoute()));
                        },
                        // color: Colors.blue,
                        textColor: Colors.white,
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: new Text("Forget Password?", style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: new Text(
                    "OR",
                    style: TextStyle(decoration: TextDecoration.underline, color: Colors.white, decorationStyle: TextDecorationStyle.double, fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                      width: double.infinity,
                      child: OutlineButton(
                        child: Container(margin: EdgeInsets.symmetric(vertical: 10), child: new Text("Create An Account", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white))),
                        onPressed: () {
                          // Navigator.pop(context);
                          // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) => LoginRoute()), (Route<dynamic> route) => true);
                        },
                        textColor: Colors.white,
                        borderSide: BorderSide(color: Colors.white),
                      )),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
