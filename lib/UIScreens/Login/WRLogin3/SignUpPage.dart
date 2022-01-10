import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'CustomInputBox.dart';

class WrSignUpPage extends StatefulWidget {
  @override
  _WrSignUpPageState createState() => _WrSignUpPageState();
}

class _WrSignUpPageState extends State<WrSignUpPage> {
  TapGestureRecognizer _tapGestureRecognizer;
  bool _showSignIn;

  @override
  void initState() {
    super.initState();
    _showSignIn = true;
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        setState(() {
          _showSignIn = !_showSignIn;
          print("Hello");
        });
      };
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0, top: 90),
                    child: Text(
                      _showSignIn ? "SIGN IN" : "SIGN UP",
                      style: TextStyle(
                        fontFamily: 'Cardo',
                        fontSize: 35,
                        color: Color(0xff0C2551),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    //
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, top: 5),
                    child: Text(
                      _showSignIn ? 'Sign up with' : 'Sign in with',
                      style: TextStyle(
                        fontFamily: 'Nunito Sans',
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                //
                SizedBox(
                  height: 20,
                ),

                _showSignIn ? login() : singup(),
                _showSignIn ? btnSingin() : btnSingup(),

                //

                // SizedBox(
                //   height: 20,
                // ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialBtn(
                      socialSingleCharector: 'f',
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    SocialBtn(
                      socialSingleCharector: 'G',
                      color: Colors.red,
                    )
                  ],
                ),
                //
              ],
            ),
          ),
          ClipPath(
            clipper: OuterClippedPart(),
            child: Container(
              color: Color(0xffFD9298),
              width: scrWidth,
              height: scrHeight,
            ),
          ),
          //
          ClipPath(
            clipper: InnerClippedPart(),
            child: Container(
              color: Color(0xff0962ff).withOpacity(0.60),
              width: scrWidth,
              height: scrHeight,
            ),
          ),
        ],
      ),
    );
  }

  Column login() {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        MyCustomInputBox(
          title: 'Email',
          hint: 'demo@test.com',
        ),
        //
        SizedBox(
          height: 10,
        ),
        //
        MyCustomInputBox(
          title: 'Password',
          hint: 'Password',
        ),
      ],
    );
  }

  GestureDetector btnSingin() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 55,
            decoration: BoxDecoration(
              color: Color(0xff0962ff),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'Sigin',
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account? ",
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8f9db5).withOpacity(0.45),
                  ),
                ),
                TextSpan(
                  text: 'Sign Up',
                  recognizer: _tapGestureRecognizer,
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0962ff),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector btnSingup() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width * 0.85,
            height: 55,
            decoration: BoxDecoration(
              color: Color(0xff0962ff),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                'SingUp',
                style: TextStyle(
                  fontFamily: 'ProductSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8f9db5).withOpacity(0.45),
                  ),
                ),
                TextSpan(
                  text: 'Sign In',
                  recognizer: _tapGestureRecognizer,
                  style: TextStyle(
                    fontFamily: 'Product Sans',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0962ff),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column singup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),

        MyCustomInputBox(
          title: 'Name',
          hint: 'Mac',
        ),
        //
        SizedBox(
          height: 10,
        ),
        // //
        MyCustomInputBox(
          title: 'Email',
          hint: 'demo@test.com',
        ),
        //
        SizedBox(
          height: 10,
        ),
        //
        MyCustomInputBox(
          title: 'Password',
          hint: 'Password',
        ),
      ],
    );
  }
}

class SocialBtn extends StatelessWidget {
  SocialBtn({this.socialSingleCharector, this.color});
  final String socialSingleCharector;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(12, 11),
            blurRadius: 26,
            color: Color(0xffaaaaaa).withOpacity(0.1),
          )
        ],
      ),
      //
      child: Center(
        child: Text(
          socialSingleCharector,
          style: TextStyle(
            fontFamily: 'ProductSans',
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Color(0xffffffff),
          ),
        ),
      ),
    );
  }
}

class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85, size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
