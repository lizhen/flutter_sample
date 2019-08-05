import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class CalendarDemo extends StatefulWidget {
  @override
  _CalendarDemoState createState() => _CalendarDemoState();
}

class _CalendarDemoState extends State<CalendarDemo> {
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Text('The Default Calendar:'),
          new Calendar(
            onSelectedRangeChange: (range) =>
                print("Range is ${range.item1}, ${range.item2}"),
            onDateSelected: (date) => handleNewDate(date),
          ),
          new Divider(
            height: 50.0,
          ),
          new Text('The Expanded Calendar:'),
          new Calendar(
            onSelectedRangeChange: (range) =>
                print("Range is ${range.item1}, ${range.item2}"),
            isExpandable: true,
          ),
          new Divider(
            height: 50.0,
          ),
          new Text('A Custom Weekly Calendar:'),
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
                  child: new Text(
                    day.day.toString(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void handleNewDate(date) {
    print("handleNewDate ${date}");
  }
}
