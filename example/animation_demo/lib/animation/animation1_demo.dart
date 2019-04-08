import 'package:flutter/material.dart';

class Animation1Demo extends StatefulWidget {
  @override
  _Animation1DemoState createState() => _Animation1DemoState();
}

class _Animation1DemoState extends State<Animation1Demo>
    with SingleTickerProviderStateMixin {
  final String _title = 'Animation';

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // 使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);

    // 图片宽高从0变到300
    // animation = Tween(begin: 0.0, end: 300.0).animate(controller) // 使用线性（匀速）
    animation = Tween(begin: 0.0, end: 300.0).animate(animation) // 使用弹性曲线
      ..addListener(() {
        setState(() {});
      });

    // 启动动画（正向执行）
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
    return Center(
      child: Image.asset(
        'assets/images/avator.gif',
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}
