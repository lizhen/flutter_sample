import 'package:article/bean/article_bean.dart';
import 'package:article/bean/image_bean.dart';
import 'package:article/network/api.dart';
import 'package:article/network/bing.dart';
import 'package:article/pages/home/home_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class SplashPage extends StatefulWidget {
  SplashPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _disposed = false;

  ImageBean imageBean;

  @override
  void initState() {
    super.initState();

    Bing.getImage().then((image) {
      setState(() {
        imageBean = image;
      });
      Future.delayed(const Duration(seconds: 3), () {
        Article.today().then((article) {
          toHome(article);
        }).catchError((e) {
          toHome(null);
        });
      });
    }).catchError((e) {
      toHome(null);
    });

    _initFluwx();
  }

  @override
  void dispose() {
    this._disposed = true;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        child: this.imageBean?.url == null
            ? Image(
                image: AssetImage('res/images/splash.png'),
                fit: BoxFit.fill,
              )
            : CachedNetworkImage(
                imageUrl: this.imageBean?.url,
                placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                errorWidget: (context, url, error) => Icon(Icons.error),
                fit: BoxFit.fitHeight,
              ),
      );
    });
  }

  toHome(ArticleBean article) {
    if (_disposed) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage(article)),
    );
  }

  _initFluwx() async {
    await fluwx.register(
      appId: "wxd930ea5d5a258f4f",
      doOnAndroid: true,
      doOnIOS: true,
      enableMTA: false,
    );
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }
}
