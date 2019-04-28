import 'package:json_annotation/json_annotation.dart';

part 'image_bean.g.dart';

@JsonSerializable()
class ImagesBean {
  List<ImageBean> images;

  ImagesBean(
    this.images
  );

  factory ImagesBean.fromJson(Map<String, dynamic> json) => _$ImagesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesBeanToJson(this);
}

@JsonSerializable()
class ImageBean {
  String startdate;
  String fullstartdate;
  String enddate;
  String url;
  String title;

  ImageBean({
    this.startdate,
    this.fullstartdate,
    this.enddate,
    this.url,
    this.title,
  });

  factory ImageBean.fromJson(Map<String, dynamic> json) =>
      _$ImageBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ImageBeanToJson(this);
}


/// flutter packages pub run build_runner build
/// flutter packages pub run build_runner watch
