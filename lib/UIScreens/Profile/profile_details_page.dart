import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'profile_details_enter_animation.dart';

class profileDetailsPage extends StatefulWidget {
  final profileDetailsEnterAnimation animation;

  profileDetailsPage({
    @required AnimationController controller,
  }) : animation = new profileDetailsEnterAnimation(controller);

  @override
  _profile_socialState createState() => _profile_socialState();
}

class _profile_socialState extends State<profileDetailsPage> {
  bool loading = true;
  List list;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Opacity(
          opacity: widget.animation.backdropOpacity.value,
          child: new Image(
            image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
            fit: BoxFit.cover,
          ),
        ),
        new BackdropFilter(
          filter: new ui.ImageFilter.blur(
            sigmaX: widget.animation.backdropBlur.value,
            sigmaY: widget.animation.backdropBlur.value,
          ),
          child: new Container(
            color: Colors.black.withOpacity(0.5),
            child: _buildContent(),
          ),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return new SingleChildScrollView(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAvatar(),
          _buildInfo(),
          // _buildVideoScroller(),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return new Transform(
      transform: new Matrix4.diagonal3Values(
        widget.animation.avatarSize.value,
        widget.animation.avatarSize.value,
        1.0,
      ),
      alignment: Alignment.center,
      child: new Container(
        width: 110.0,
        height: 110.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.white30),
        ),
        margin: const EdgeInsets.only(top: 32.0, left: 16.0),
        padding: const EdgeInsets.all(3.0),
        child: new ClipOval(
          child: new Image(
            image: CachedNetworkImageProvider("https://smartkit.wrteam.in/smartkit/images/profile2.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    String name = "Lily	Piper";
    return new Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView(
            shrinkWrap: true, // use it
            children: name
                .split(" ")
                .map((String text) => new Text(
                      text,
                      style: new TextStyle(
                        color: Colors.white.withOpacity(widget.animation.nameOpacity.value),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    )) // put the text inside a widget
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(
              "Bhuj Kuchhch",
              style: new TextStyle(
                color: Colors.white.withOpacity(widget.animation.locationOpacity.value),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          new Container(
            color: Colors.white.withOpacity(0.85),
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: widget.animation.dividerWidth.value,
            height: 1.0,
          ),
          new Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam",
            style: new TextStyle(
              color: Colors.white.withOpacity(widget.animation.biographyOpacity.value),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new AnimatedBuilder(
        animation: widget.animation.controller,
        builder: _buildAnimation,
      ),
    );
  }
}
