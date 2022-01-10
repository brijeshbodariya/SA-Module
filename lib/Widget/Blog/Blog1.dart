import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Blog1 extends StatefulWidget {
  Blog1({Key key}) : super(key: key);

  @override
  _Blog1State createState() => _Blog1State();
}

class _Blog1State extends State<Blog1> with TickerProviderStateMixin {
  final infoHeight = 364.0;
  AnimationController animationController;
  Animation<double> animation;
  var opacity1 = 0.0;
  var opacity2 = 0.0;
  var opacity3 = 0.0;
  void setData() async {
    animationController.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  void initState() {
    animationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animationController, curve: Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.black,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 1.2,
                      child: FadeInImage(
                        image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/28.jpg"),
                        placeholder: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: (MediaQuery.of(context).size.width / 1.5) - 24.0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.grey.withOpacity(0.2), offset: Offset(1.1, 1.1), blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 32.0, left: 18, right: 16),
                              child: Text(
                                "Game Changing Virtual Reality Console Hits the Market",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  letterSpacing: 0.27,
                                ),
                              ),
                            ),
                            Expanded(
                                child: SingleChildScrollView(
                                    child: ConstrainedBox(
                                        constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.minHeight),
                                        child: IntrinsicHeight(
                                            //child: Expanded(
                                            child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 500),
                                          opacity: opacity2,
                                          child: Padding(
                                              padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Phasellus non fringilla sapien. Aenean eget nisl euismod, congue massa vitae, cursus nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus ultricies eget urna ac imperdiet. Donec eleifend ut libero quis tincidunt. Etiam malesuada tempor lorem, a tempor nibh eleifend et. Praesent condimentum dui vitae lectus interdum cursus."),
                                                  FadeInImage(
                                                    image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg"),
                                                    placeholder: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Divider(),
                                                  FadeInImage(
                                                    image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/Nikereak1.jpg"),
                                                    placeholder: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/placeholder.png"),
                                                    fit: BoxFit.cover,
                                                    width: MediaQuery.of(context).size.width,
                                                    height: MediaQuery.of(context).size.height * .3,
                                                  )
                                                ],
                                              )),
                                          // ),
                                        ))))),
                            AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: opacity3,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 48,
                                      height: 48,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          border: new Border.all(color: Colors.grey.withOpacity(0.2)),
                                        ),
                                        child: Icon(
                                          Icons.bookmark_border,
                                          color: Colors.blue,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(16.0),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(color: Colors.blue.withOpacity(0.5), offset: Offset(1.1, 1.1), blurRadius: 10.0),
                                          ],
                                        ),
                                        child: Center(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.share,
                                                color: Colors.white,
                                              ),
                                            SizedBox(width:10),
                                              Text(
                                                "Share",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, letterSpacing: 0.0, color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        // ))),
                        ),
                  ),
                ),
                Positioned(
                  top: (MediaQuery.of(context).size.width / 1.5) - 24.0 - 35,
                  right: 35,
                  child: new ScaleTransition(
                    alignment: Alignment.center,
                    scale: new CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
                    child: Card(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                      elevation: 10.0,
                      child: Container(
                        width: 60,
                        height: 60,
                        child: Center(
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
