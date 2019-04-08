import 'package:flutter/material.dart';

class CustomViewDemo extends StatefulWidget {
  @override
  _CustomViewDemoState createState() => _CustomViewDemoState();
}

/// 它可以包含多种滚动模型，举个例子，假设有一个页面，顶部需要一个GridView，
/// 底部需要一个ListView，而要求整个页面的滑动效果是统一的，即它们看起来是一个整体，
/// 如果使用GridView+ListView来实现的话，就不能保证一致的滑动效果，因为它们的滚动效果是分离的，
/// 所以这时就需要一个"胶水"，把这些彼此独立的可滚动widget（Sliver）"粘"起来，而CustomScrollView的功能就相当于“胶水”。

class _CustomViewDemoState extends State<CustomViewDemo> {
  @override
  Widget build(BuildContext context) {
    // 因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    // Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          // AppBar，包含一个导航栏
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Demo'),
              background: Image.asset(
                'assets/images/avator.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
