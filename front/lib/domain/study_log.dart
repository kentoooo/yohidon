import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/memo.dart';
import 'package:yohidon/domain/study_time.dart';

class StudyLog {
  final ParentCategory parentCategory;
  final ChildCategory? childCategory;
  final Memo memo;
  final StudyTime studyTime;

  StudyLog(this.parentCategory, this.childCategory, this.memo, this.studyTime);

  factory StudyLog.of(ParentCategory parentCategory, ChildCategory childCategory, Memo memo, StudyTime studyTime) =>
      StudyLog(
        parentCategory,
        childCategory.categoryId.value == "" ? null : childCategory,
        memo,
        studyTime,
      );
}

class ParentCategory {
  final CategoryId categoryId;
  final CategoryName categoryName;

  ParentCategory(this.categoryId, this.categoryName);
}

class ChildCategory {
  final CategoryId categoryId;
  final CategoryName categoryName;

  ChildCategory(this.categoryId, this.categoryName);
}
