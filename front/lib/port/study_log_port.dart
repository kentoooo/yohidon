import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/study_log.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/driver/study_log_json.dart';
import 'package:yohidon/driver/yohidon_api.dart';

abstract class StudyLogPort {
  Future<void> save(StudyLog studyLog, UserId userId);
}

@Injectable(as: StudyLogPort)
class StudyLogGateway extends StudyLogPort {

  @override
  Future<void> save(StudyLog studyLog, UserId userId) async {
    await YohidonApi().postStudyLog(studyLog.toStudyLogJson(), userId.value);
  }
}

extension StudyLogToStudyLogJson on StudyLog {
  StudyLogJson toStudyLogJson() =>
      StudyLogJson(category.categoryId.value, studyTime.value);
}