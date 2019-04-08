import 'package:flutter/material.dart';

/// 细心的读者可能已经发现上面示例中通过addListener()和setState() 来更新UI这一步其实是通用的，如果每个动画中都加这么一句是比较繁琐的。
/// AnimatedWidget类封装了调用setState()的细节，并允许我们将Widget分离出来，重构后的代码如下：
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Image.asset(
        'assets/images/avator.gif',
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
