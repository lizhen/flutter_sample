import 'package:flutter/material.dart';

import 'gesture/gesture1_demo.dart';
import 'gesture/gesture2_demo.dart';
import 'gesture/gesture3_demo.dart';
import 'gesture/gesture4_demo.dart';
import 'gesture/gesture5_demo.dart';
import 'notification/notification_demo.dart';
import 'pointer/pointer_demo.dart';

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