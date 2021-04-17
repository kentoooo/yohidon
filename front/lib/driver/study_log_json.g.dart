// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_log_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudyLogJson _$StudyLogJsonFromJson(Map<String, dynamic> json) {
  return StudyLogJson(
    json['categoryId'] as String,
    json['memo'] as String,
    (json['time'] as num).toDouble(),
  );
}

Map<String, dynamic> _$StudyLogJsonToJson(StudyLogJson instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'memo': instance.memo,
      'time': instance.time,
    };
