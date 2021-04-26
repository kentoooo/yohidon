import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/state/state.dart';

@singleton
class ChildCategoryListViewState extends ChangeNotifier with ViewState {
  @override
  void updateComplete() {
    notifyListeners();
  }

  ChildCategoryList childCategoryList = ChildCategoryList([]);
  String categoryName = "";
  String parentCategoryId = "";
}

class ChildCategoryList {
  final List<ChildCategoryListItem> values;

  ChildCategoryList(this.values);
}

class ChildCategoryListItem extends Equatable with ChangeNotifier, ViewState{
  final String id;
  final String name;

  ChildCategoryListItem(this.id, this.name);

  @override
  List<Object?> get props => [id];

  @override
  void updateComplete() {
    notifyListeners();
  }
}