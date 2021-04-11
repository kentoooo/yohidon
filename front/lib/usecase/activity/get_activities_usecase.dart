import 'package:injectable/injectable.dart';
import 'package:yohidon/port/activity_port.dart';
import 'package:yohidon/presenter/activity_presenter.dart';

@injectable
class GetActivitiesUsecase {
  final ActivityPort _activityPort;
  final ActivityPresenter _activityPresenter;

  GetActivitiesUsecase(this._activityPort, this._activityPresenter);

  Future<void> execute() async {
    final activities = await _activityPort.findAll();
   _activityPresenter.setActivities(activities);
  }

}