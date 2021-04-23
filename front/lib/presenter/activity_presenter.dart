import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/activity.dart';
import 'package:yohidon/state/activity_view_state.dart';

@injectable
class ActivityPresenter {
  final ActivityViewState _state;

  ActivityPresenter(this._state);

  void setActivities(Activities activities) {
    _state.items = activities
        .map((e) => ActivityItem(
              e.activityName.value,
              e.userName.value,
              e.timeSpent.value.toString(),
              e.activityDate.toString(),
              e.memo.toDisplay(),
            ))
        .toList();
    _state.updateComplete();
  }
}
