import 'package:flutter/material.dart';

import 'column/column1_demo.dart';
import 'flex/flex1_demo.dart';
import 'row/row1_demo.dart';
import 'stack/stack1_demo.dart';
import 'stack/stack2_demo.dart';
import 'wrap/wrap1_demo.dart';

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
      home: Column1Demo(),
    );
  }
}
