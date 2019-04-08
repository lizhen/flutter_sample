import 'package:flutter/material.dart';

class NotificationDemo extends StatefulWidget {
  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

//pixels：当前滚动位置。
//maxScrollExtent：最大可滚动长度。
//extentBefore：滑出ViewPort顶部的长度；此示例中相当于顶部滑出屏幕上方的列表长度。
//extentInside：ViewPort内部长度；此示例中屏幕显示的列表部分的长度。
//extentAfter：列表中未滑入ViewPort部分的长度；此示例中列表底部未显示到屏幕范围部分的长度。
//atEdge：是否滑到了Scrollable Widget的边界（此示例中相当于列表顶或底部）。

/// NotificationListener是一个Widget，模板参数T是想监听的通知类型，如果省略，则所有类型通知都会被监听，
/// 如果指定特定类型，则只有该类型的通知会被监听。NotificationListener需要一个onNotification回调函数，
/// 用于实现监听处理逻辑，该回调可以返回一个布尔值，代表是否阻止该事件继续向上冒泡，如果为true时，则冒泡终止，
/// 事件停止向上传播，如果不返回或者返回值为false 时，则冒泡继续。
class _NotificationDemoState extends State<NotificationDemo> {
  final String _title = '滚动监听';

  String _progress = '0%'; // 保存进度百分比

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;

          setState(() {
            _progress = '${(progress * 100).toInt()}%';
          });

          print('BottomEdge: ${notification.metrics.extentAfter == 0}');
          // return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 100,
              itemExtent: 50.0,
              itemBuilder: (context, index) {
                return ListTile(title: Text('$index'));
              },
            ),
            CircleAvatar(
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
