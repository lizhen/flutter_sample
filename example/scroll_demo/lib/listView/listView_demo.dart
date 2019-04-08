import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

//ListView({
//  ...
//  //可滚动widget公共参数
//  Axis scrollDirection = Axis.vertical,
//  bool reverse = false,
//  ScrollController controller,
//  bool primary,
//  ScrollPhysics physics,
//  EdgeInsetsGeometry padding,
//
//  //ListView各个构造函数的共同参数
//  double itemExtent,
//  bool shrinkWrap = false,
//  bool addAutomaticKeepAlives = true,
//  bool addRepaintBoundaries = true,
//  double cacheExtent,
//
//  //子widget列表
//  List<Widget> children = const <Widget>[],
//})
/**
 *
    itemExtent：
      该参数如果不为null，则会强制children的"长度"为itemExtent的值；
      这里的"长度"是指滚动方向上子widget的长度，即如果滚动方向是垂直方向，则itemExtent代表子widget的高度，
      如果滚动方向为水平方向，则itemExtent代表子widget的长度。在ListView中，指定itemExtent比让子widget自己决定自身长度会更高效，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，而不是总是动态去计算，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
    shrinkWrap：
      该属性表示是否根据子widget的总长度来设置ListView的长度，默认值为false 。
      默认情况下，ListView的会在滚动方向尽可能多的占用空间。
      当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
    addAutomaticKeepAlives：
      该属性表示是否将列表项（子widget）包裹在AutomaticKeepAlive widget中；
      典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，
      在该列表项滑出视口时该列表项不会被GC，它会使用KeepAliveNotification来保存其状态。
      如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
    addRepaintBoundaries：
      该属性表示是否将列表项（子widget）包裹在RepaintBoundary中。
      当可滚动widget滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，
      但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效。
      和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
 */

/// 注意：可滚动widget通过一个List来作为其children属性时，只适用于子widget较少的情况，这是一个通用规律，并非ListView自己的特性，像GridView也是如此。
class _ListViewDemoState extends State<ListViewDemo> {
  final String _title = 'List Demo';

  static const loadingTag = '###loading###'; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Column(
        children: <Widget>[
          ListTile(title: Text('商品列表')),
          Expanded(
            child: _buildListView(),
          ),
        ],
      ),
    );
  }

  _buildListView() {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        // 如果到了表尾
        if (_words[index] == loadingTag) {
          // 不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            // 获取数据
            _retrieveData();
            // 加载显示loading
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            // 已经加载了100条数据，不再获取数据。
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: Text(
                '没有更多了',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }

        return ListTile(title: Text(_words[index]));
      },
      separatorBuilder: (context, index) => Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
        _words.length - 1,
        generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
      );
      setState(() {});
    });
  }
}
