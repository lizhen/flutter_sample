import 'package:flutter/material.dart';

class Column1Demo extends StatefulWidget {
  @override
  _Column1DemoState createState() => _Column1DemoState();
}

class _Column1DemoState extends State<Column1Demo> {
  final String _title = '线性布局';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, // 有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, // 无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text('hello world'),
                    Text('I am Jack'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
