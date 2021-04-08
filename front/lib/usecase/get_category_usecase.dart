import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/port/category_port.dart';
import 'package:yohidon/presenter/register_presenter.dart';

@injectable
class GetCategoryUsecase extends ChangeNotifier {
  final CategoryPort _categoryPort;
  final RegisterPresenter _presenter;

  GetCategoryUsecase(this._categoryPort, this._presenter);

  Future<void> execute() async {
    final categories = await _categoryPort.findAll(UserId('aaaa'));
    _presenter.setCategories(categories);
  }

}