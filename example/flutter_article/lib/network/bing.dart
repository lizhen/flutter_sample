import 'dart:convert';

import 'package:article/bean/image_bean.dart';
import 'package:article/utils/errors.dart';
import 'package:http/http.dart' as http;

final String baseUrl = 'http://cn.bing.com';

final String todayImage = '/HPImageArchive.aspx?format=js&idx=0&n=1';

final String baseImage = 'http://s.cn.bing.net';

class Bing {

  static Future<ImageBean> getImage() async {
    String url = '$baseUrl$todayImage';

    return await getRequest(url);
  }

  static Future<ImageBean> getRequest(String url) async {
    ImageBean imageBean;
    http.Response response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 400) {
      try {
        Map<String, dynamic> map = json.decode(response.body);
        ImagesBean imagesBean = ImagesBean.fromJson(map);
        imageBean = imagesBean.images.first;
        imageBean.url = '$baseImage${imageBean.url}';
      } catch (e) {
        print(e);
        throw NetError(response: response, error: e);
      }
    } else {
      throw NetError(response: response);
    }

    return imageBean;
  }

}