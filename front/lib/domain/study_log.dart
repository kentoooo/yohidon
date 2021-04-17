import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/memo.dart';
import 'package:yohidon/domain/study_time.dart';

class StudyLog {
  final Category category;
  final Memo memo;
  final StudyTime studyTime;

  StudyLog(this.category, this.memo, this.studyTime);
}