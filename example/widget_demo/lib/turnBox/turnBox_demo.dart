import 'package:flutter/material.dart';
import 'package:widget_demo/turnBox/turnBox_widget.dart';

class TurnBoxDemo extends StatefulWidget {
  @override
  _TurnBoxDemoState createState() => _TurnBoxDemoState();
}

class _TurnBoxDemoState extends State<TurnBoxDemo> {
  final String _title = '任意旋转';

  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildTurnBox(),
    );
  }

  _buildTurnBox() {
    return Center(
      child: Column(
        children: <Widget>[
          TurnBox(
            turns: _turns,
            speed: 500,
            child: Icon(Icons.refresh, size: 50.0),
          ),
          TurnBox(
            turns: _turns,
            speed: 1000,
            child: Icon(Icons.refresh, size: 150.0),
          ),
          RaisedButton(
            child: Text('顺时针旋转1/5圈'),
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
          ),
          RaisedButton(
            child: Text('逆时针旋转1/5圈'),
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
          ),
        ],
      ),
    );
  }
}
