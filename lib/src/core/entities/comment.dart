import 'package:json_annotation/json_annotation.dart';
import 'package:places/src/core/entities/place.dart';
import 'package:places/src/core/entities/user.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Comment({this.id, this.comment, this.rating, this.user, this.place});

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  int id;
  String comment;
  double rating;
  User user;
  Place place;

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
