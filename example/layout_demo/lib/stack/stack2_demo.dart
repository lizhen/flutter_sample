import 'package:flutter/material.dart';

class Stack2Demo extends StatefulWidget {
  @override
  _Stack2DemoState createState() => _Stack2DemoState();
}

class _Stack2DemoState extends State<Stack2Demo> {
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
    return Stack(
      alignment: Alignment.center,
      // 未定位widget占满Stack整个空间
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          left: 18.0,
          child: Text('I an Jack'),
        ),
        // 没有定位，所以fit属性会对它起作用，就会占满Stack
        Container(
          child: Text(
            'Hello world',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.red,
        ),
        Positioned(
          top: 18.0,
          child: Text('Your friend'),
        )
      ],
    );
  }
}
