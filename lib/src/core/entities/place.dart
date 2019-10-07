import 'package:json_annotation/json_annotation.dart';
import 'package:places/src/core/entities/image.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  Place(
      {this.id,
      this.title,
      this.description,
      this.rating,
      this.location,
      this.latitude,
      this.longitude,
      this.images});

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  int id;
  String title;
  String description;
  double rating;
  String location;
  double latitude;
  double longitude;
  List<Image> images;

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
