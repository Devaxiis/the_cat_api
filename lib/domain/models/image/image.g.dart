// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CatImage _$$_CatImageFromJson(Map<String, dynamic> json) => _$_CatImage(
      breeds: (json['breeds'] as List<dynamic>?)
              ?.map((e) => Breed.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      id: json['id'] as String,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$$_CatImageToJson(_$_CatImage instance) =>
    <String, dynamic>{
      'breeds': instance.breeds.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
