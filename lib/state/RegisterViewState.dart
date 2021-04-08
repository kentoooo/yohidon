import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class RegisterViewState extends ChangeNotifier with State {

  @override
  void updateComplete() {
    notifyListeners();
  }

  SelectItems? selectItems;
  SelectItem? selectedItem;
}

class SelectItems {
  final List<SelectItem> values;
  SelectItems(this.values);
}

class SelectItem extends Equatable with ChangeNotifier, State {
  final String id;
  final String name;

  SelectItem(this.id, this.name);

  @override
  List<Object?> get props => [id];

  @override
  void updateComplete() {
    notifyListeners();
  }
}


abstract class State {
  void updateComplete();
}