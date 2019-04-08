import 'package:flutter/material.dart';

class EachView extends StatefulWidget {
  EachView(this._title);

  String _title;

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
    );
  }
}
