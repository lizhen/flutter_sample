import 'package:flutter/material.dart';

class Padding1Demo extends StatefulWidget {
  @override
  _Padding1DemoState createState() => _Padding1DemoState();
}

class _Padding1DemoState extends State<Padding1Demo> {
  final String _title = 'Padding';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildPadding(),
    );
  }

  Widget _buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // 显式指定对齐方式为左对齐，排除对齐干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Hello world'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text('I am Jack'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, .0, 20.0, 20.0),
            child: Text('Your friend'),
          ),
        ],
      ),
    );
  }
}
