import 'package:flutter/material.dart';

class NotificationDemo extends StatefulWidget {
  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

/// 注意：代码中注释的部分是不能正常工作的，因为这个context是根Context，
/// 而NotificationListener是监听的子树，所以我们通过Builder来构建RaisedButton，来获得按钮位置的context。
class _NotificationDemoState extends State<NotificationDemo> {
  final String _title = 'Notification';

  String _msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildNotification(),
    );
  }

  _buildNotification() {
    return NotificationListener<MyNotification>(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + "  ";
        });
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
//            RaisedButton(
//              child: Text('Send Notification'),
//              onPressed: () => MyNotification('Hi').dispatch(context),
//            ),
            Builder(
              builder: (context) {
                return RaisedButton(
                  child: Text('Send Notification'),
                  onPressed: () => MyNotification('Hi').dispatch(context),
                );
              },
            ),
            Text(_msg),
          ],
        ),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
