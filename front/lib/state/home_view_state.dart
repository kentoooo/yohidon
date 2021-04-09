import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/state/state.dart';

@singleton
class HomeViewState extends ChangeNotifier with ViewState {
  @override
  void updateComplete() {
    notifyListeners();
  }

  int currentIndex = 1;
}