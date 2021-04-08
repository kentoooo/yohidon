import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/state/state.dart';

@singleton
class LoginViewState extends ChangeNotifier with ViewState {
  @override
  void updateComplete() {
    notifyListeners();
  }

  String? emailAddress;
  String? password;
}