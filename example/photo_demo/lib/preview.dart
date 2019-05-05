import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

import 'asset_image.dart';

class PreviewPage extends StatelessWidget {
  const PreviewPage({Key key, this.list = const []}) : super(key: key);

  final List<AssetEntity> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预览'),
      ),
      body: ListView(
        children: list
            .map((item) => AssetImageWidget(
                  assetEntity: item,
                  width: 300,
                  height: 200,
                  boxFit: BoxFit.cover,
                ))
            .toList(),
      ),
    );
  }
}
