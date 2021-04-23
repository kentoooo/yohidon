import 'package:intl/intl.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/user_id.dart';

import 'fcc.dart';
import 'memo.dart';

class Activities extends FCC<Activity> {
  @override
  final List<Activity> list;
  Activities(this.list);
}

class Activity {
  final UserId userId;
  final UserName userName;
  final ActivityName activityName;
  final TimeSpent timeSpent;
  final ActivityDate activityDate;
  final Memo memo;

  Activity(this.userId, this.userName, this.activityName, this.timeSpent, this.activityDate, this.memo);
}

class UserName {
  final String value;
  UserName(this.value);
}

class ActivityName {
  final String value;
  ActivityName(this.value);
}

class TimeSpent {
  final double value;
  TimeSpent(this.value);
}

class ActivityDate {
  final DateTime value;
  ActivityDate(this.value);

  factory ActivityDate.of(DateTime dateTime) {
    return ActivityDate(dateTime.toLocal());
  }

  String toString() {
    final format = DateFormat('yyyy-MM-dd HH:mm');
    return format.format(value);
  }
}