import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredView1Demo extends StatefulWidget {
  @override
  _StaggeredView1DemoState createState() => _StaggeredView1DemoState();
}

class _StaggeredView1DemoState extends State<StaggeredView1Demo> {
  final String _title = 'StaggeredView1Demo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildStaggeredView(),
    );
  }

  _buildStaggeredView() {

  }
}
