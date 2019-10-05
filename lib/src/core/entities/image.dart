import 'package:json_annotation/json_annotation.dart';
import 'package:places/src/core/entities/place.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  Image(this.id, this.path, this.place);

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  final int id;
  final String path;
  final Place place;

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
