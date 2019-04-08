import 'package:flutter/material.dart';

class SizedBoxDemo extends StatefulWidget {
  @override
  _SizedBoxDemoState createState() => _SizedBoxDemoState();
}

class _SizedBoxDemoState extends State<SizedBoxDemo> {
  final String _title = 'SizedBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildSizedBox(),
    );
  }

  Widget _redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  Widget _buildSizedBox() {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: Container(
        height: 5.0,
        child: _redBox,
      ),
    );
  }
}
