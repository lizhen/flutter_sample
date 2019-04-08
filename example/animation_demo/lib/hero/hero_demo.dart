import 'package:flutter/material.dart';

class HeroDemo extends StatelessWidget {
  final String _title = 'Hero';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: 'avatar', // 唯一标记，前后两个路由页Hero的tag必须相同
          child: ClipOval(
            child: Image.asset(
              'assets/images/avator.gif',
              width: 50.0,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  body: Center(
                    child: Hero(
                      tag: 'avatar', // 唯一标记，前后两个路由页Hero的tag必须相同
                      child: Image.asset(
                        'assets/images/avator.gif',
                      ),
                    ),
                  ),
                ),
              );
            }
          ));
        },
      ),
    );
  }
}
