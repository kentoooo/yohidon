import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/activity.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/driver/activity_json.dart';
import 'package:yohidon/driver/yohidon_api.dart';

abstract class ActivityPort {
  Future<Activities> findAll();
}

@Injectable(as: ActivityPort)
class ActivityGateway extends ActivityPort {
  @override
  Future<Activities> findAll() async {
    final response = await YohidonApi().getActivities();
    return response.toActivities();
  }
}

extension JsonToActivities on ActivitiesJson {
  Activities toActivities() =>
      Activities(activities.map((a) => Activity(
          UserId(a.userId),
          UserName(a.userName),
          ActivityName(a.categoryName),
          TimeSpent(a.studyTime),
          ActivityDate.of(a.created))).toList());
}

