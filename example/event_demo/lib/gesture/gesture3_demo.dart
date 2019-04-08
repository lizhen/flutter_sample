import 'package:flutter/material.dart';

class Gesture3Demo extends StatefulWidget {
  @override
  _Gesture3DemoState createState() => _Gesture3DemoState();
}

class _Gesture3DemoState extends State<Gesture3Demo> {
  final String _title = 'GestureDetector';

  double _top = 0.0;
  double _left = 0.0;

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
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text('A')),
            onVerticalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _top += details.delta.dy;
              });
            },
            onHorizontalDragUpdate: (DragUpdateDetails details) {
              setState(() {
                _left += details.delta.dx;
              });
            },
          ),
        ),
      ],
    );
  }
}
