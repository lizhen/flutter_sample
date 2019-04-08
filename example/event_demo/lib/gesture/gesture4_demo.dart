import 'package:flutter/material.dart';

class Gesture4Demo extends StatefulWidget {
  @override
  _Gesture4DemoState createState() => _Gesture4DemoState();
}

class _Gesture4DemoState extends State<Gesture4Demo> {
  final String _title = 'GestureDetector';

  double _width = 200.0; // 通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildGesture(),
    );
  }

  _buildGesture() {
    return Center(
      child: GestureDetector(
        child: Image.asset('assets/images/sea.png', width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            // 缩放倍数在0.8到10倍之间
            _width = 200 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}
