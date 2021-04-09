import 'package:injectable/injectable.dart';
import 'package:yohidon/presenter/home_presenter.dart';

@injectable
class ChangePageUsecase {
  final HomePresenter _presenter;

  ChangePageUsecase(this._presenter);
  void execute(int index) {
    _presenter.setIndex(index);
  }
}