import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/state/state.dart';

@singleton
class RegisterViewState extends ChangeNotifier with ViewState {

  @override
  void updateComplete() {
    notifyListeners();
  }

  SelectItems? selectItems;
  SelectItem? selectedItem;
  double rating = 0.0;
}

class SelectItems {
  final List<SelectItem> values;
  SelectItems(this.values);
}

class SelectItem extends Equatable with ChangeNotifier, ViewState {
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