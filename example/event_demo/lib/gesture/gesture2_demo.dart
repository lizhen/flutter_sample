import 'package:flutter/material.dart';

class Gesture2Demo extends StatefulWidget {
  @override
  _Gesture2DemoState createState() => _Gesture2DemoState();
}

// DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕(而非父widget)原点(左上角)的偏移。
// DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。
// DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），示例中并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画。

class _Gesture2DemoState extends State<Gesture2Demo> {
  final String _title = 'GestureDetector';

  double _top = 0.0; // 距顶部的偏移
  double _left = 0.0;// 距左边的偏移

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
            child: CircleAvatar(
              child: Text('A'),
            ),
            onPanDown: (DragDownDetails e) {
              // 打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            onPanUpdate: (DragUpdateDetails e) {
              // 用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              // 打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        ),
      ],
    );
  }
}
