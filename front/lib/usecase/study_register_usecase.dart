import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/study_log.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/port/study_log_port.dart';
import 'package:yohidon/port/user_credential_port.dart';

@injectable
class StudyRegisterUsecase {

  final StudyLogPort _studyLogPort;
  final UserCredentialPort _userCredentialPort;

  StudyRegisterUsecase(this._studyLogPort, this._userCredentialPort);

  Future<void> execute(StudyLog studyLog) async {
    final userCredential = await _userCredentialPort.get();
    await _studyLogPort.save(studyLog, userCredential!.userid);
  }
}