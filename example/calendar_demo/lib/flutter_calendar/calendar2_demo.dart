import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class Calendar2Demo extends StatefulWidget {
  @override
  _Calendar2DemoState createState() => _Calendar2DemoState();
}

class _Calendar2DemoState extends State<Calendar2Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Demo'),
      ),
      body: _buildBodySection(),
    );
  }

  _buildBodySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Calendar(
            onSelectedRangeChange: (range) =>
                print("Range is ${range.item1}, ${range.item2}"),
            isExpandable: true,
            dayBuilder: (BuildContext context, DateTime day) {
              return new InkWell(
                onTap: () => print("OnTap ${day}"),
                child: new Container(
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black38)),
                  child: Column(
                    children: <Widget>[
                      new Text(
                        day.day.toString(),
                      ),
                      Text('迟到'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
