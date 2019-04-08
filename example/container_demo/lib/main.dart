import 'package:flutter/material.dart';

import 'box/constrainedBox_demo.dart';
import 'box/decoratedBox_demo.dart';
import 'box/sizedBox_demo.dart';
import 'padding/padding1_demo.dart';
import 'transform/transform_demo.dart';

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
      home: TransformDemo(),
    );
  }
}
