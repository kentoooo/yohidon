import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/memo.dart';
import 'package:yohidon/presenter/register_presenter.dart';

@injectable
class ChangeMemoUsecase {
  final RegisterPresenter _registerPresenter;

  ChangeMemoUsecase(this._registerPresenter);
  void execute(Memo memo) {
    _registerPresenter.setMemo(memo);
  }
}