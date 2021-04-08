import 'package:json_annotation/json_annotation.dart';

part 'study_log_json.g.dart';

@JsonSerializable()
class StudyLogJson {
  final String categoryId;
  final double time;

  Map<String, dynamic> toJson() => _$StudyLogJsonToJson(this);

  StudyLogJson(this.categoryId, this.time);
}