import 'package:flutter/material.dart';

class Stack1Demo extends StatefulWidget {
  @override
  _Stack1DemoState createState() => _Stack1DemoState();
}

class _Stack1DemoState extends State<Stack1Demo> {
  final String _title = '层叠布局';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._title),
      ),
      body: this._buildBodySection(),
    );
  }

  Widget _buildBodySection() {
    // 通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        // 指定未定位或部分定位widget的对齐方式
        alignment: Alignment.center,
        children: <Widget>[
          // 没有定位，它会居中显示
          Container(
            child: Text(
              'Hello world',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
          // 部分定位，垂直方向居中
          Positioned(
            left: 18.0,
            child: Text('I am Jack'),
          ),
          // 部分定位，水平方向居中
          Positioned(
            top: 18.0,
            child: Text('Your friend'),
          ),
        ],
      ),
    );
  }
}
