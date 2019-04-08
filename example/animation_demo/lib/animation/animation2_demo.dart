import 'package:animation_demo/animation/animatedImage.dart';
import 'package:animation_demo/animation/growTransition.dart';
import 'package:flutter/material.dart';

class Animation2Demo extends StatefulWidget {
  @override
  _Animation2DemoState createState() => _Animation2DemoState();
}

//dismissed 	动画在起始点停止
//forward 	  动画正在正向执行
//reverse 	  动画正在反向执行
//completed 	动画在终点停止
class _Animation2DemoState extends State<Animation2Demo>
    with SingleTickerProviderStateMixin {
  final String _title = 'Animation';

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = new AnimationController(
        duration: const Duration(seconds: 3), vsync: this);

    // 图片宽高从0变到300
    animation = new Tween(begin: 0.0, end: 300.0).animate(controller);

    // 动画监听
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

    // 启动动画
    controller.forward();
  }

  @override
  void dispose() {
    // 路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildAnimation(),
    );
  }

  _buildAnimation() {
//     1.继承自AnimatedWidget解决自己控制和setState()
//     return AnimatedImage(animation: animation);
//      2.使用AnimatedBuilder构建
//    return AnimatedBuilder(
//      animation: animation,
//      child: Image.asset('assets/images/avator.gif'),
//      builder: (BuildContext ctx, Widget child) {
//        return Center(
//          child: Container(
//            width: animation.value,
//            height: animation.value,
//            child: child,
//          ),
//        );
//      },
//    );
//    3.Transition构建
    return GrowTransition(
      child: Image.asset('assets/images/avator.gif'),
      animation: animation,
    );
  }
}
