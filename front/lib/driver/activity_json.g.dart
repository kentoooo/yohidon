// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitiesJson _$ActivitiesJsonFromJson(Map<String, dynamic> json) {
  return ActivitiesJson(
    (json['activities'] as List<dynamic>)
        .map((e) => ActivityJson.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ActivitiesJsonToJson(ActivitiesJson instance) =>
    <String, dynamic>{
      'activities': instance.activities,
    };

ActivityJson _$ActivityJsonFromJson(Map<String, dynamic> json) {
  return ActivityJson(
    json['userId'] as String,
    json['userName'] as String,
    json['categoryId'] as String,
    json['categoryName'] as String,
    (json['studyTime'] as num).toDouble(),
    DateTime.parse(json['created'] as String),
    json['memo'] as String,
  );
}

Map<String, dynamic> _$ActivityJsonToJson(ActivityJson instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'studyTime': instance.studyTime,
      'created': instance.created.toIso8601String(),
      'memo': instance.memo,
    };
