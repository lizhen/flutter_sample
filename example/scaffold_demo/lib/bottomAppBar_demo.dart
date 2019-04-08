import 'package:flutter/material.dart';

class BottomAppBarDemo extends StatefulWidget {
  @override
  _BottomAppBarDemoState createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home)),
            SizedBox(), // 中间位置空出
            IconButton(icon: Icon(Icons.business)),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 均分底部导航栏横向空间
        ),
      ),
    );
  }
}
