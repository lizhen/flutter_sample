import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PaintDemo extends StatelessWidget {
  final String _title = '五子棋/盘';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildPaint(),
    );
  }

  _buildPaint() {
    return Center(
      child: GestureDetector(
        child: CustomPaint(
          size: Size(300, 300), // 指定画布大小
          painter: MyPainter(),
        ),
        onTapUp: (TapUpDetails detail) {
          print('onTapUp');
        },
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double eWidth = size.width / 15;
    double eHeight = size.height / 15;

    // 画棋盘背景
    var paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill // 填充
      ..color = Color(0x77cdb175); // 背景为屎黄色

    canvas.drawRect(Offset.zero & size, paint);

    // 画棋盘网格
    paint
      ..style = PaintingStyle.stroke // 线
      ..color = Colors.black87
      ..strokeWidth = 1.0;

    for (int i = 0; i <= 15; ++i) {
      double dy = eHeight * i;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }

    for (int i = 0; i <= 15; ++i) {
      double dx = eWidth * i;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }

    // 画一颗黑子
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    canvas.drawCircle(
      Offset(size.width / 2 - eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

    // 画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(size.width / 2 + eWidth / 2, size.height / 2 - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );
  }

  @override
  // 在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
