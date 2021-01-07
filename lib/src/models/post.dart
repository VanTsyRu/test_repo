import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  final DateTime start;
  final DateTime end;
  final String name;
  final String description;
  final Map<String, List<Map<String, dynamic>>> days;

  Post({this.start, this.end, this.name, this.description, this.days});
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
