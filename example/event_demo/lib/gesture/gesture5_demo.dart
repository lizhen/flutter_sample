import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Gesture5Demo extends StatefulWidget {
  @override
  _Gesture5DemoState createState() => _Gesture5DemoState();
}

class _Gesture5DemoState extends State<Gesture5Demo> {
  final String _title = 'GestureDetector';

  TapGestureRecognizer _gestureRecognizer = new TapGestureRecognizer();

  bool _toggle = false; // 变色开关

  @override
  void dispose() {
    // 用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _gestureRecognizer.dispose();
    super.dispose();
  }

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
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '你好世界'),
            TextSpan(
              text: '点我变色',
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _gestureRecognizer..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }
            ),
            TextSpan(text: '你好世界'),
          ]
        ),
      ),
    );
  }
}
