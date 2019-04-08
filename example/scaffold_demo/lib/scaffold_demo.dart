import 'package:flutter/material.dart';

class ScaffoldDemo extends StatefulWidget {
  @override
  _ScaffoldDemoState createState() => _ScaffoldDemoState();
}

//AppBar({
//  Key key,
//  this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
//  this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
//  this.title,// 页面标题
//  this.actions, // 导航栏右侧菜单
//  this.bottom, // 导航栏底部菜单，通常为Tab按钮组
//  this.elevation = 4.0, // 导航栏阴影
//  this.centerTitle, //标题是否居中
//  this.backgroundColor,
//  ...   //其它属性见源码注释
//})

class _ScaffoldDemoState extends State<ScaffoldDemo>
    with SingleTickerProviderStateMixin {
  final String _title = 'Scaffold Demo';

  // 定义一个globalKey, 由于GlobalKey要保持全局唯一性，我们使用静态变量存储
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();

  TabController _tabController; // 需要定义一个Controller
  List tabs = ['新闻', '历史', '图片'];

  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();

    // 创建Controller
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(_title),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      drawer: new MyDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        // DrawerHeader consumes top MediaQuery padding.
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 80.0,
                      ),
                    ),
                  ),
                  Text(
                    'Wendux',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
