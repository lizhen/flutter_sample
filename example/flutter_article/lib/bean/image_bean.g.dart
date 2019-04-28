// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesBean _$ImagesBeanFromJson(Map<String, dynamic> json) {
  return ImagesBean((json['images'] as List)
      ?.map((e) =>
          e == null ? null : ImageBean.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$ImagesBeanToJson(ImagesBean instance) =>
    <String, dynamic>{'images': instance.images};

ImageBean _$ImageBeanFromJson(Map<String, dynamic> json) {
  return ImageBean(
      startdate: json['startdate'] as String,
      fullstartdate: json['fullstartdate'] as String,
      enddate: json['enddate'] as String,
      url: json['url'] as String,
      title: json['title'] as String);
}

Map<String, dynamic> _$ImageBeanToJson(ImageBean instance) => <String, dynamic>{
      'startdate': instance.startdate,
      'fullstartdate': instance.fullstartdate,
      'enddate': instance.enddate,
      'url': instance.url,
      'title': instance.title
    };
