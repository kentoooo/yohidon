import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/state/state.dart';

@singleton
class ActivityViewState extends ChangeNotifier with ViewState {
  @override
  void updateComplete() {
    notifyListeners();
  }
  List<ActivityItem> items = [];
}

class ActivityItem {
  final String activityName;
  final String userName;
  final String timeSpent;
  final String activityDate;

  ActivityItem(this.activityName, this.userName, this.timeSpent, this.activityDate);
}
