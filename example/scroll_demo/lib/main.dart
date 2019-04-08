import 'package:flutter/material.dart';

import 'controller/controller_demo.dart';
import 'customView/customView_demo.dart';
import 'gridView/gridView_demo.dart';
import 'listView/listView_demo.dart';
import 'singleView/singleView_demo.dart';
import 'notification/notification_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationDemo(),
    );
  }
}