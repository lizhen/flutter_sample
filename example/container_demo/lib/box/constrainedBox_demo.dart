import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatefulWidget {
  @override
  _ConstrainedBoxDemoState createState() => _ConstrainedBoxDemoState();
}


class _ConstrainedBoxDemoState extends State<ConstrainedBoxDemo> {
  final String _title = 'ConstrainedBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildConstrainedBox(),
    );
  }

  Widget _redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  // 可以看到，我们虽然将Container的高度设置为5像素，但是最终却是50像素，这正是ConstrainedBox的最小高度限制生效了。
  // 如果将Container的高度设置为80像素，那么最终红色区域的高度也会是80像素，因为在此示例中，ConstrainedBox只限制了最小高度，并未限制最大高度。
  Widget _buildConstrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity, // 宽度尽可能大
        minHeight: 50.0, // 最小高度为50像素
      ),
      child: Container(
        height: 5.0,
        child: _redBox,
      ),
    );
  }
}
