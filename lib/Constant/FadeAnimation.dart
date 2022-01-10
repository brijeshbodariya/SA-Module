import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations.dart';

enum _AniProps { opacity, translateX }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(
        _AniProps.translateX,
        Tween(begin: 30.0, end: 0.0),
        Duration(milliseconds: 500),
        // Curves.fastOutSlowIn,
        Curves.easeInOut,
      );

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
            offset: Offset(value.get(_AniProps.translateX), 0), child: child),
      ),
    );
  }
}
