import 'package:flutter/material.dart';
import 'dart:math';

class TransformDemo extends StatefulWidget {
  @override
  _TransformDemoState createState() => _TransformDemoState();
}

class _TransformDemoState extends State<TransformDemo> {
  final String _title = 'Transform';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: <Widget>[
          _buildTransform(),
          _buildTranslate(),
          _buildRotate(),
          _buildScale(),
          _buildWaring(),
          _buildRotatedBox(),
        ],
      ),
    );
  }

  _buildTransform() {
    return Container(
      color: Colors.black,
      child: Transform(
        alignment: Alignment.topRight, // 相对于坐标系原点的对齐方式
        transform: new Matrix4.skewY(0.3), // 沿Y轴倾斜0.3弧度
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.deepOrange,
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }

  // 平移
  _buildTranslate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.translate(
        offset: Offset(-20.0, -5.0),
        child: Text('Hello world'),
      ),
    );
  }

  // 旋转
  _buildRotate() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        angle: pi / 2,
        child: Text('Hello world'),
      ),
    );
  }

  // 缩放
  _buildScale() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.scale(
        scale: 1.5, // 放大到1.5倍
        child: Text('Hello world'),
      ),
    );
  }

  // 注意
  // 由于第一个Text应用变换(放大)后，其在绘制时会放大，但其占用的空间依然为红色部分，所以第二个text会紧挨着红色部分，最终就会出现文字有重合部分。
  _buildWaring() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
            decoration:BoxDecoration(color: Colors.red),
            child: Transform.scale(scale: 1.5,
                child: Text("Hello world")
            )
        ),
        Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
      ],
    );
  }

  // RotatedBox和Transform.rotate功能相似，它们都可以对子widget进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小。
  _buildRotatedBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, // 旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
      ],
    );
  }
}
