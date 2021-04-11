import 'package:intl/intl.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/user_id.dart';

import 'fcc.dart';

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

  Activity(this.userId, this.userName, this.activityName, this.timeSpent, this.activityDate);
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
    final format = DateFormat('yyyy-MM-dd');
    return format.format(value);
  }
}