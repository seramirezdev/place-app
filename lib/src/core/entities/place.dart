import 'package:json_annotation/json_annotation.dart';

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
      this.longitude});

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  int id;
  String title;
  String description;
  double rating;
  String location;
  double latitude;
  double longitude;

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
