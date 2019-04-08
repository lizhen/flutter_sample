import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  @override
  _WebViewDemoState createState() => _WebViewDemoState();
}

// /mnt/files/static
class _WebViewDemoState extends State<WebViewDemo> {
  final String _title = '';

  String selectedUrl = 'http://10.1.230.30:15805/webview_flutter_test.html';

  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          // NavigationControls(_controller.future),
          // SampleMenu(_controller.future),
        ],
      ),
      body: Builder(builder: (BuildContext context) {
        return WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
          javascriptChannels: <JavascriptChannel>[
            _toasterJavascriptChannel(context),
          ].toSet(),
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              print('blocking navigation to $request');
              return NavigationDecision.prevent;
            }
            print('allowing navigation to $request');
            return NavigationDecision.navigate;
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 注意Android端和iOS端的返回值格式是不一样的，Android端返回的是json字符串，iOS暂时只支持string和string格式的NSArray，其他类型数据还不支持。
          _controller?.evaluateJavascript('callJS("visible")')?.then((result) {
            print('Call JS Result: $result');
          });
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        Scaffold.of(context).showSnackBar(
          SnackBar(content: Text(message.message)),
        );
      },
    );
  }
}
