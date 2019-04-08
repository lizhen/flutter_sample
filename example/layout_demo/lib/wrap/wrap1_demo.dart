import 'package:flutter/material.dart';

class Wrap1Demo extends StatefulWidget {
  @override
  _Wrap1DemoState createState() => _Wrap1DemoState();
}

class _Wrap1DemoState extends State<Wrap1Demo> {
  final String _title = '流式布局';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._title),
      ),
      body: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, // 沿主轴方向居中
        children: <Widget>[
          Chip(
            avatar: CircleAvatar(
              child: Text('A'),
              backgroundColor: Colors.blue,
            ),
            label: Text('Hamilton'),
          ),
          Chip(
            avatar: CircleAvatar(
              child: Text('M'),
              backgroundColor: Colors.blue,
            ),
            label: Text('Lafayette'),
          ),
          Chip(
            avatar: CircleAvatar(
              child: Text('H'),
              backgroundColor: Colors.blue,
            ),
            label: Text('Mulligan'),
          ),
          Chip(
            avatar: CircleAvatar(
              child: Text('J'),
              backgroundColor: Colors.blue,
            ),
            label: Text('Laurens'),
          ),
        ],
      ),
    );
  }
}
