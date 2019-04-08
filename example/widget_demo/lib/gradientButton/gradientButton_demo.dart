import 'package:flutter/material.dart';
import 'package:widget_demo/gradientButton/gradientButton_widget.dart';

class GradientButtonDemo extends StatefulWidget {
  @override
  _GradientButtonDemoState createState() => _GradientButtonDemoState();
}

class _GradientButtonDemoState extends State<GradientButtonDemo> {
  final String _title = '渐变Button';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildGradientButton(),
    );
  }

  _buildGradientButton() {
    return Container(
      child: Column(
        children: <Widget>[
          GradientButton(
            colors: [Colors.orange,Colors.red],
            height: 50.0,
            child: Text("Submit"),
            onTap:onTap ,
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightGreen, Colors.green[700]],
            child: Text("Submit"),
            onTap: onTap,
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            child: Text("Submit"),
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  onTap(){
    print("button click");
  }
}

