import 'package:flutter/material.dart';

class ContainerDemo extends StatefulWidget {
  @override
  _ContainerDemoState createState() => _ContainerDemoState();
}

//Container({
//  this.alignment,
//  this.padding, //容器内补白，属于decoration的装饰范围
//  Color color, // 背景色
//  Decoration decoration, // 背景装饰
//  Decoration foregroundDecoration, //前景装饰
//  double width,//容器的宽度
//  double height, //容器的高度
//  BoxConstraints constraints, //容器大小的限制条件
//  this.margin,//容器外补白，不属于decoration的装饰范围
//  this.transform, //变换
//  this.child,
//})
class _ContainerDemoState extends State<ContainerDemo> {
  final String _title = 'Container';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildContainer(),
    );
  }

  _buildContainer() {
    return Container(
      margin: const EdgeInsets.only(top: 50.0, left: 120.0), // 容器外补白
      constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), // 卡片大小
      decoration: BoxDecoration(
        // 背景装饰
        gradient: RadialGradient(
          // 背景径向渐变
          colors: [Colors.red, Colors.orange],
          center: Alignment.topLeft,
          radius: .98,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(2.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      transform: Matrix4.rotationZ(.2), // 卡片倾斜变换
      alignment: Alignment.center,
      child: Text(
        '5.20',
        style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
    );
  }
}
