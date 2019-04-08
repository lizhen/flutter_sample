import 'package:flutter/material.dart';

class PointerDemo extends StatefulWidget {
  @override
  _PointerDemoState createState() => _PointerDemoState();
}

//Listener({
//  Key key,
//  this.onPointerDown, //手指按下回调
//  this.onPointerMove, //手指移动回调
//  this.onPointerUp,//手指抬起回调
//  this.onPointerCancel,//触摸事件取消回调
//  this.behavior = HitTestBehavior.deferToChild, //在命中测试期间如何表现
//  Widget child
//})

//
//deferToChild：子widget会一个接一个的进行命中测试，如果子Widget中有测试通过的，则当前Widget通过，这就意味着，如果指针事件作用于子Widget上时，其父(祖先)Widget也肯定可以收到该事件。
//
//opaque：在命中测试时，将当前Widget当成不透明处理(即使本身是透明的)，最终的效果相当于当前Widget的整个区域都是点击区域。举个例子：
//
//Listener(
//child: ConstrainedBox(
//constraints: BoxConstraints.tight(Size(300.0, 150.0)),
//child: Center(child: Text("Box A")),
//),
////behavior: HitTestBehavior.opaque,
//onPointerDown: (event) => print("down A")
//),
//
//上例中，只有点击文本内容区域才会触发点击事件，因为 deferToChild 会去子widget判断是否命中测试，而该例中子widget就是 Text("Box A") 。 如果我们想让整个300×150的矩形区域都能点击我们可以将behavior设为HitTestBehavior.opaque。注意，该属性并不能用于在Widget树中拦截（忽略）事件，它只是决定命中测试时的Widget大小。
//
//translucent：当点击Widget透明区域时，可以对自身边界内及底部可视区域都进行命中测试，这意味着点击顶部widget透明区域时，顶部widget和底部widget都可以接收到事件，例如：

class _PointerDemoState extends State<PointerDemo> {
  final String _title = 'PointerEvent';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Stack(
        children: <Widget>[
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(300.0, 200.0)),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            ),
          ),
          Listener(
            child: ConstrainedBox(
              constraints: BoxConstraints.tight(Size(200.0, 100.0)),
              child: Center(
                child: Text('左上角200*100范围内非文本区域点击'),
              ),
            ),
            onPointerDown: (event) => print('down1'),
            // behavior: HitTestBehavior.translucent, //放开此行注释后可以"点透"
          ),
        ],
      ),
    );
  }
}
