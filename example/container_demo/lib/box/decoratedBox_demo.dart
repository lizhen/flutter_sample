import 'package:flutter/material.dart';

class DecoratedBoxDemo extends StatefulWidget {
  @override
  _DecoratedBoxDemoState createState() => _DecoratedBoxDemoState();
}

//BoxDecoration({
//  Color color, //颜色
//  DecorationImage image,//图片
//  BoxBorder border, //边框
//  BorderRadiusGeometry borderRadius, //圆角
//  List<BoxShadow> boxShadow, //阴影,可以指定多个
//  Gradient gradient, //渐变
//  BlendMode backgroundBlendMode, //背景混合模式
//  BoxShape shape = BoxShape.rectangle, //形状
//})
class _DecoratedBoxDemoState extends State<DecoratedBoxDemo> {
  final String _title = 'DecoratedBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildDecoratedBox(),
    );
  }

  _buildDecoratedBox() {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.red, Colors.orange[700]],
        ), // 背景渐变
        borderRadius: BorderRadius.circular(3.0), // 3像素圆角
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
