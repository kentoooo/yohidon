import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/study_log.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/port/study_log_port.dart';

@injectable
class StudyRegisterUsecase {

  final StudyLogPort _studyLogPort;

  StudyRegisterUsecase(this._studyLogPort);

  Future<void> execute(StudyLog studyLog, UserId userId) async {
    await _studyLogPort.save(studyLog, userId);
  }
}