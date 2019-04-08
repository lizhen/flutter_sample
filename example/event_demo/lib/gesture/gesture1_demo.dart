import 'package:flutter/material.dart';

class Gesture1Demo extends StatefulWidget {
  @override
  _Gesture1DemoState createState() => _Gesture1DemoState();
}

/// 注意： 当同时监听onTap和onDoubleTap事件时，当用户触发tap事件时，会有200毫秒左右的延时，
/// 这是因为当用户点击完之后很可能会再次点击以触发双击事件，所以GestureDetector会等一断时间来确定是否为双击事件。
/// 如果用户只监听了onTap（没有监听onDoubleTap）事件时，则没有延时。
class _Gesture1DemoState extends State<Gesture1Demo> {
  final String _title = 'GestureDetector';

  String _operation = 'NO Gesture detected!';

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
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200.0,
          height: 100.0,
          child: Text(
            _operation,
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: () => updateText('Tap'), // 点击
        onDoubleTap: () => updateText('DoubleTap'), // 双击
        onLongPress: () => updateText('LongPress'), // 长击
      ),
    );
  }

  updateText(String text) {
    setState(() {
      _operation = text;
    });
  }
}
