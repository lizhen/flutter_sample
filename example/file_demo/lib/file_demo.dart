import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';

class FileDemo extends StatefulWidget {
  @override
  _FileDemoState createState() => _FileDemoState();
}

class _FileDemoState extends State<FileDemo> {
  final String _title = '文件操作';

  int _counter;

  @override
  void initState() {
    super.initState();
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;

    return new File('$dir/counter.txtx');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String counters = await file.readAsString();
      return int.parse(counters);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Center(
        child: Text('点击了$_counter次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
