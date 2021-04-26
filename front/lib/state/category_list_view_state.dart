import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/state/state.dart';

@singleton
class CategoryListViewState extends ChangeNotifier with ViewState {

  @override
  void updateComplete() {
    notifyListeners();
  }

  CategoryList categoryList = CategoryList([]);
  String categoryName = "";
}

class CategoryList {
  final List<CategoryListItem> values;

  CategoryList(this.values);
}

class CategoryListItem extends Equatable with ChangeNotifier, ViewState{
  final String id;
  final String name;

  CategoryListItem(this.id, this.name);

  @override
  List<Object?> get props => [id];

  @override
  void updateComplete() {
    notifyListeners();
  }
}