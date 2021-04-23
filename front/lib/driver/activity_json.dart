import 'package:json_annotation/json_annotation.dart';

part 'activity_json.g.dart';

@JsonSerializable()
class ActivitiesJson {
  final List<ActivityJson> activities;
  ActivitiesJson(this.activities);
  factory ActivitiesJson.fromJson(Map<String, dynamic> json) => _$ActivitiesJsonFromJson(json);
}

@JsonSerializable()
class ActivityJson {
  final String userId;
  final String userName;
  final String categoryId;
  final String categoryName;
  final double studyTime;
  final DateTime created;
  final String memo;

  ActivityJson(this.userId, this.userName, this.categoryId, this.categoryName, this.studyTime, this.created, this.memo);
  factory ActivityJson.fromJson(Map<String, dynamic> json) => _$ActivityJsonFromJson(json);
}