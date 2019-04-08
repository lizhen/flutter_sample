import 'package:flutter/material.dart';

/// Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、SizeTransition、FractionalTranslation等，
/// 很多时候都可以复用这些预置的过渡类。
class GrowTransition extends StatelessWidget {

  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: animation.value,
            height: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
