import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({this.id, this.username, this.name, this.password, this.fcmToken});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  int id;
  String username;
  String name;
  String password;
  String fcmToken;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
