import 'package:injectable/injectable.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/presenter/home_presenter.dart';

import 'activity/get_activities_usecase.dart';

@injectable
class ChangePageUsecase {
  final HomePresenter _presenter;

  ChangePageUsecase(this._presenter);
  void execute(int index) async {
    await getIt<GetActivitiesUsecase>().execute();
    _presenter.setIndex(index);
  }
}