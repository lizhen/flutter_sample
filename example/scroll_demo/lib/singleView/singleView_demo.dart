import 'package:flutter/material.dart';

class SingleViewDemo extends StatefulWidget {
  @override
  _SingleViewDemoState createState() => _SingleViewDemoState();
}

class _SingleViewDemoState extends State<SingleViewDemo> {
  final String _title = 'Single Demo';

  String str = 'ABCDEFGHIJKLMNOPQRSTUVWSYZ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildSingleView(),
    );
  }

  _buildSingleView() {
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            // 每一个字母都用一个Text显示,字体为原来的两倍
            children: str
                .split('')
                .map((c) => Text(
                      c,
                      textScaleFactor: 2.0,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
