import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/port/category_port.dart';
import 'package:yohidon/port/user_credential_port.dart';
import 'package:yohidon/presenter/register_presenter.dart';

@injectable
class GetCategoryUsecase extends ChangeNotifier {
  final CategoryPort _categoryPort;
  final UserCredentialPort _userCredentialPort;
  final RegisterPresenter _presenter;

  GetCategoryUsecase(this._categoryPort, this._presenter, this._userCredentialPort);

  Future<void> execute() async {
    final userCredential = await _userCredentialPort.get();
    final categories = await _categoryPort.findAll(userCredential!.userid);
    final childCategories = await _categoryPort.findChildCategories(categories.first.categoryId);
    _presenter.setCategories(categories);
    _presenter.setChildCategories(childCategories);
  }

}