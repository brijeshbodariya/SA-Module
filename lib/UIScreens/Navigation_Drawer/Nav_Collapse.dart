import 'package:flutter/material.dart';
import 'package:smartkit/Constant/SmartKitColor.dart';
import '../Navigation_Drawer/Nav_Collapsing_support.dart';

class TestesCollapsingContainer extends StatefulWidget {
  @override
  TestesCollapsingContainerState createState() => TestesCollapsingContainerState();
}

class TestesCollapsingContainerState extends State<TestesCollapsingContainer> with SingleTickerProviderStateMixin {
  final _drawer = GlobalKey<CollapsingContainerState>();

  //This controller optional. Use only if you want to share the animation with other widgets like the "JustATile" (below)
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CollapsingContainer(
          key: _drawer,
          animationController: animationController,
          body: SafeArea(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) => ListTile(title: Text("A text on the side")),
            ),
          ),
          drawer: SafeArea(
            child: Material(
              color: cryptocolor2,
              elevation: 4,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) => JustATile(animationController, index),
                      itemCount: 30,
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  IconButton(
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_arrow,
                      progress: animationController,
                    ),
                    onPressed: () {
                      _drawer.currentState.switchState();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class JustATile extends StatefulWidget {
  final AnimationController animationController;
  final int index;

  JustATile(this.animationController, this.index);

  @override
  _JustATileState createState() => _JustATileState();
}

class _JustATileState extends State<JustATile> {
  Animation<double> _animation;

  @override
  void initState() {
    _animation = Tween<double>(begin: 1.0, end: 0).animate(widget.animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget child) {
        Color textcolor = tiletextcolor[widget.index % tiletextcolor.length];
        return ListTile(
          onTap: () {
            print("You tapped");
          },
          leading: CircleAvatar(
            backgroundColor: textcolor,
          ),
          title: Opacity(
            opacity: 1 - _animation.value,
            child: Text(
              "Title at ${widget.index}",
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
        );
      },
      animation: _animation,
    );
  }
}
