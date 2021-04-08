import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/study_time.dart';
import 'package:yohidon/presenter/register_presenter.dart';

@injectable
class ChangeSliderUsecase {
  final RegisterPresenter _presenter;

  ChangeSliderUsecase(this._presenter);

  void execute(StudyTime studyTime) {
    _presenter.setRate(studyTime);
  }
}