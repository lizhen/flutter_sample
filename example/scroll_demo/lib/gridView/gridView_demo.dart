import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  final String _title = 'Grid Demo';

  List<IconData> _icons = []; // 保存Icon数据

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildGridView(),
    );
  }

  _buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 每列三行
        childAspectRatio: 1.0, // 显示区域宽高相等
      ),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        // 如果显示到最后一个并且Icon总数小于200时继续获取数据
        if (index == _icons.length - 1 && _icons.length < 200) {
          _retrieveIcons();
        }

        return Icon(_icons[index]);
      },
    );
  }

  void _retrieveIcons() {
    Future.delayed(Duration(microseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
