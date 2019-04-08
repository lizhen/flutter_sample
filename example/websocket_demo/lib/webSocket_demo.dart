import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketDemo extends StatefulWidget {
  @override
  _WebSocketDemoState createState() => _WebSocketDemoState();
}

class _WebSocketDemoState extends State<WebSocketDemo> {
  final String _title = 'WebSocket(内容回显)';

  TextEditingController _controller = new TextEditingController();
  IOWebSocketChannel channel;
  String _text = '';

  @override
  void initState() {
    super.initState();
    // 创建websocket连接
    channel = new IOWebSocketChannel.connect('ws://echo.websocket.org');
  }

  @override
  void dispose() {
    channel.sink.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
            StreamBuilder(
              stream: channel.stream,
              builder: (context, snapshot) {
                // 网络不通走到这
                if (snapshot.hasError) {
                  _text = '网络不通...';
                } else if (snapshot.hasData) {
                  _text = 'echo: ' + snapshot.data;
                }
                
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(_text),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send Message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      channel.sink.add(_controller.text);
    }
  }
}
