import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartkit/FullApp/Music/Constant.dart';

import 'staggered_enter_animation.dart';

class StaggeredAnimation extends StatelessWidget {
  StaggeredAnimation({
    Key key,
    @required AnimationController controller,
  })  : animation = StaggeredAnimationEnterAnimation(controller),
        super(key: key);
  final StaggeredAnimationEnterAnimation animation;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE1F0F4),
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: (context, child) => _buildAnimation(context, child, size),
      ),
    );
  }

  Widget _buildAnimation(BuildContext context, Widget child, Size size) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    useMobileLayout = shortestSide < 600;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                topBar(animation.barHeight.value),
                circle(
                  size,
                  animation.avatarSize.value,
                ),
                Positioned(
                  left: 10,
                  top: 50,
                  child: Opacity(
                    opacity: animation.titleOpacity.value,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          Text(
                            "Diane	Wilson",
                            style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),
                          ),
                          Text(
                            "demo@demo.com",
                            style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Opacity(
            opacity: animation.textOpacity.value,
            child: Container(
                padding: new EdgeInsets.only(top: MediaQuery.of(context).size.width / 6, right: 20.0, left: 20.0),
                child: new Container(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Text("Photos", style: Theme.of(context).textTheme.subtitle2),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("5", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Text("Following", style: Theme.of(context).textTheme.subtitle2),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("54", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: <Widget>[
                              Text("Followers", style: Theme.of(context).textTheme.subtitle2),
                              Padding(padding: const EdgeInsets.all(8.0), child: Text("5445", style: Theme.of(context).textTheme.subtitle2.copyWith(color: Colors.red[400], fontWeight: FontWeight.bold))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ),

          Opacity(
            opacity: animation.textOpacity.value,
            child: Container(
                padding: new EdgeInsets.only(top: 20, right: 20.0, left: 20.0),
                child: new Container(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                        color: Colors.white,
                        elevation: 4.0,
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.red[400],
                                  ),
                                ),
                                Text(
                                  "demo@demo.com",
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.red[400],
                                  ),
                                ),
                                Text(
                                  "545644454",
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.cake,
                                    color: Colors.red[400],
                                  ),
                                ),
                                Text(
                                  "2096-12-31",
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.red[400],
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                  ),
                                )),
                              ],
                            ),
                          ],
                        )))),
          )
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Column(
          //     children: <Widget>[
          //       SizedBox(height: 50),
          //       Opacity(
          //         opacity: animation.titleOpacity.value,
          //         child: placeholderBox(28, 150, Alignment.centerLeft),
          //       ),
          //       // SizedBox(height: 6),
          //       // // Opacity(
          //       // //   opacity: animation.textOpacity.value,
          //       // //   child: placeholderBox1(250, double.infinity, Alignment.centerLeft),
          //       // // ),
          //       // SizedBox(height: 6),
          //       // Opacity(
          //       //   opacity: animation.imageOpacity.value,
          //       //   // child: placeholderBox2(Alignment.center),
          //       // ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  Container topBar(double height) {
    return Container(
      height: height,
      width: double.infinity,
      //color: Colors.blue,
      child: SvgPicture.asset(
        "assets/shape.svg",
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Positioned circle(Size size, double animationValue) {
    return Positioned(
      top: 100,
      right: 0.0,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          animationValue,
          animationValue,
          1.0,
        ),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.shade300,
            image: DecorationImage(image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/le1.png")),
          ),
        ),
      ),
    );
  }

  Align placeholderBox(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFD5EBEC),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text("Trekking Mountain Instruction"),
        ),
      ),
    );
  }

  Align placeholderBox1(double height, double width, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 490,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Color(0xFFC7E4E9),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("1. Start walking now (it’s never too early to start training)."),
              SizedBox(
                height: 10,
              ),
              Text("2. Make leg-based cardio part of your routine…"),
              SizedBox(
                height: 10,
              ),
              Text("3. …and take the stairs every chance you get"),
              SizedBox(
                height: 10,
              ),
              Text("4. Make sure you’re walking properly"),
              SizedBox(
                height: 10,
              ),
              Text("5. Mix up your training terrain…"),
              SizedBox(
                height: 10,
              ),
              Text("6. …and walk in all types of weather"),
              SizedBox(
                height: 10,
              ),
              Text("7. Try using walking poles"),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: width,
                // child: Image.asset(
                //   "assets/poles.jpg",
                //   fit: BoxFit.cover,
                // ),
              ),
              SizedBox(
                height: 10,
              ),
              Text("8. Train with a backpack"),
              SizedBox(
                height: 10,
              ),
              Text("9. Keep the tank fuelled"),
              SizedBox(
                height: 10,
              ),
              Text("10. Invest in a good pair of shoes"),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: width,
                // child: Image.asset(
                //   "assets/camp.jpg",
                //   fit: BoxFit.cover,
                // ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // _buildImage(String imgPath) {
  //   return Padding(padding: EdgeInsets.only(right: 15.0), child: Container(height: 50.0, width: 115.0, decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0), image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover))));
  // }

  // Widget placeholderBox2(Alignment alignment) {
  //   return Align(
  //     alignment: alignment,
  //     child: Container(height: 70.0, child: ListView(scrollDirection: Axis.horizontal, children: [_buildImage('assets/images.jpeg'), _buildImage('assets/images1.jpeg'), _buildImage('assets/images2.jpeg')])),
  //   );
  // }
}
