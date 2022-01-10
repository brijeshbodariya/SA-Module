import 'package:flutter/material.dart';

class WrOpacityWidget extends StatefulWidget {
  final int index;
  final AnimationController animationController;
  final double duration;
  final Widget widgets;

  WrOpacityWidget({this.index, this.animationController, this.duration, this.widgets});

  @override
  _WrOpacityWidgetState createState() => _WrOpacityWidgetState();
}

class _WrOpacityWidgetState extends State<WrOpacityWidget> {
  Animation _animation;
  double start;
  double end;

  @override
  void initState() {
    super.initState();
    start = (widget.duration * widget.index).toDouble();
    end = start + widget.duration;
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          start,
          end,
          curve: Curves.easeIn,
        ),
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation.value,
      child: widget.widgets,
    );
  }
}
