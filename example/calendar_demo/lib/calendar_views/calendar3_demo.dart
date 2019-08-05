import 'package:flutter/material.dart';

import 'day_view_example.dart';
import 'days_page_view_example.dart';
import 'month_page_view_example.dart';
import 'month_view_example.dart';

class Calendar3Demo extends StatefulWidget {
  @override
  _Calendar3DemoState createState() => _Calendar3DemoState();
}

class _Calendar3DemoState extends State<Calendar3Demo> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "calendar_views example",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("calendar_views example"),
        ),
        body: new Builder(builder: (BuildContext context) {
          return new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text("Day View"),
                subtitle: new Text("DayView Example"),
                onTap: () {
                  _showWidgetInFullScreenDialog(
                    context,
                    new DayViewExample(),
                  );
                },
              ),
              new Divider(height: 0.0),
              new ListTile(
                title: new Text("Days Page View"),
                subtitle: new Text("DaysPageView Example"),
                onTap: () {
                  _showWidgetInFullScreenDialog(
                    context,
                    new DaysPageViewExample(),
                  );
                },
              ),
              new Divider(height: 0.0),
              new ListTile(
                title: new Text("Month Page View"),
                subtitle: new Text("MonthPageView Example"),
                onTap: () {
                  _showWidgetInFullScreenDialog(
                    context,
                    new MonthPageViewExample(),
                  );
                },
              ),
              new Divider(height: 0.0),
              new ListTile(
                title: new Text("Month View"),
                subtitle: new Text("MonthView Example"),
                onTap: () {
                  _showWidgetInFullScreenDialog(
                    context,
                    new MonthViewExample(),
                  );
                },
              ),
              new Divider(height: 0.0),
            ],
          );
        }),
      ),
    );
  }

  void _showWidgetInFullScreenDialog(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return widget;
        },
      ),
    );
  }
}
