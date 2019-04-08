import 'package:flutter/material.dart';

class ControllerDemo extends StatefulWidget {
  @override
  _ControllerDemoState createState() => _ControllerDemoState();
}

/// 一个ScrollController可以同时被多个Scrollable Widget使用，ScrollController会为每一个Scrollable Widget创建一个ScrollPosition对象，
/// 这些ScrollPosition保存在ScrollController的positions属性中（List）。
/// ScrollPosition是真正保存滑动位置信息的对象，offset只是一个便捷属性：
class _ControllerDemoState extends State<ControllerDemo> {
  final String _title = '滚动监听';

  ScrollController _controller = new ScrollController();

  bool showToTopBtn = false; // 是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      print(_controller.offset); // 打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    // 为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Scrollbar(
        child: ListView.builder(
          controller: _controller,
          itemCount: 100,
          itemExtent: 50.0, // 列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
          itemBuilder: (context, index) {
            return ListTile(title: Text('$index'));
          },
        ),
      ),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(
                  .0,
                  duration: Duration(milliseconds: 200), // 动画时间
                  curve: Curves.ease, // 动画曲线
                );
              },
            ),
    );
  }
}
