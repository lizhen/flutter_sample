import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class ProfileDemo extends StatefulWidget {
  ProfileDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfileDemoState createState() => _ProfileDemoState();
}

class _ProfileDemoState extends State<ProfileDemo> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final String imgUrl =
        'https://gss2.bdstatic.com/-fo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=3b1af59da651f3ded7bfb136f5879b7a/4034970a304e251f33c6d9afae86c9177f3e53b7.jpg';

    return new Stack(
      children: <Widget>[
        new Container(
          color: Colors.blue,
        ),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
            appBar: new AppBar(
              title: new Text(widget.title),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
            drawer: new Drawer(
              child: new Container(),
            ),
            backgroundColor: Colors.transparent,
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: _height / 12,
                  ),
                  new CircleAvatar(
                    radius: _width < _height ? _width / 4 : _height / 4,
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                  new SizedBox(
                    height: _height / 25.0,
                  ),
                  new Text(
                    '乔治·卢卡斯',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.white),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 30, left: _width / 8, right: _width / 8),
                    child: new Text(
                      '1944年5月14日出生于美国加利福尼亚莫德斯托，\n美国导演、编剧、制片人，毕业于南加州大学电影系',
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: _width / 25,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Divider(
                    height: _height / 30,
                    color: Colors.white,
                  ),
                  new Row(
                    children: <Widget>[
                      rowCell(343, 'POSTS'),
                      rowCell(673826, 'FOLLOWERS'),
                      rowCell(275, 'FOLLOWING'),
                    ],
                  ),
                  new Divider(height: _height / 30, color: Colors.white),
                  new Padding(
                    padding: new EdgeInsets.only(
                        left: _width / 8, right: _width / 8),
                    child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.person),
                          new SizedBox(
                            width: _width / 30,
                          ),
                          new Text('FOLLOW')
                        ],
                      )),
                      color: Colors.blue[50],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
        child: new Column(
          children: <Widget>[
            new Text(
              '$count',
              style: new TextStyle(color: Colors.white),
            ),
            new Text(type,
                style: new TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal))
          ],
        ),
      );
}
