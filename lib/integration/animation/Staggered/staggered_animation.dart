import 'package:flutter/material.dart';

import 'StaggeredAnimation.dart';

class StaggeredAnimationAnimation extends StatefulWidget {
  @override
  _StaggeredAnimationAnimationState createState() => _StaggeredAnimationAnimationState();
}

class _StaggeredAnimationAnimationState extends State<StaggeredAnimationAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    _controller.forward();

    _playAnimation();
  }

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
    } on TickerCanceled {}
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredAnimation(
      controller: _controller,
    );
  }
}
