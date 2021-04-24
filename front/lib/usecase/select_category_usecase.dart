import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/port/category_port.dart';
import 'package:yohidon/presenter/register_presenter.dart';

@injectable
class SelectCategoryUsecase extends ChangeNotifier {

  final CategoryPort _categoryPort;
  final RegisterPresenter _presenter;

  SelectCategoryUsecase(this._presenter, this._categoryPort);

  void execute(Category category) async {
    _presenter.setSelectedCategory(category);
    final children = await _categoryPort.findChildCategories(category.categoryId);
    _presenter.setChildCategories(children);
  }

  void selectChildCategory(Category category) async {
    _presenter.setSelectedChildCategory(category);
  }
}