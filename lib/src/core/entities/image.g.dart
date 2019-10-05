// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    json['id'] as int,
    json['path'] as String,
    json['place'] == null
        ? null
        : Place.fromJson(json['place'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
      'place': instance.place,
    };
