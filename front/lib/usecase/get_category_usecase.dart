import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/port/category_port.dart';
import 'package:yohidon/port/user_credential_port.dart';
import 'package:yohidon/presenter/category_list_presenter.dart';
import 'package:yohidon/presenter/child_category_list_presenter.dart';
import 'package:yohidon/presenter/register_presenter.dart';

@injectable
class GetCategoryUsecase extends ChangeNotifier {
  final CategoryPort _categoryPort;
  final UserCredentialPort _userCredentialPort;
  final RegisterPresenter _presenter;
  final CategoryListPresenter _categoryListPresenter;
  final ChildCategoryListPresenter _childCategoryListPresenter;

  GetCategoryUsecase(this._categoryPort, this._presenter, this._userCredentialPort, this._categoryListPresenter, this._childCategoryListPresenter);

  Future<void> execute() async {
    final userCredential = await _userCredentialPort.get();
    final categories = await _categoryPort.findAll(userCredential!.userid);
    final childCategories = await _categoryPort.findChildCategories(categories.first.categoryId);
    _presenter.setCategories(categories);
    _presenter.setChildCategories(childCategories);
  }

  Future<void> getCategories() async {
    final userCredential = await _userCredentialPort.get();
    final categories = await _categoryPort.findAll(userCredential!.userid);
    _categoryListPresenter.setCategories(categories);
  }

  Future<void> getChildCategories(CategoryId categoryId) async {
    final categories = await _categoryPort.findChildCategories(categoryId);
    _childCategoryListPresenter.setChildCategories(categories);
  }

}