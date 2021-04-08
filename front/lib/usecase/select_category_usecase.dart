import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/presenter/register_presenter.dart';

@injectable
class SelectCategoryUsecase extends ChangeNotifier {

  final RegisterPresenter _presenter;

  SelectCategoryUsecase(this._presenter);

  void execute(Category category) {
    _presenter.setSelectedCategory(category);
  }
}