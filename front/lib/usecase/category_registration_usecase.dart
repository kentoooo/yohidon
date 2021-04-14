import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/port/category_port.dart';
import 'package:yohidon/port/user_credential_port.dart';
import 'package:yohidon/presenter/register_presenter.dart';
import 'package:yohidon/usecase/get_category_usecase.dart';

@injectable
class CategoryRegistrationUsecase {
  final CategoryPort _categoryPort;
  final RegisterPresenter _registerPresenter;
  final UserCredentialPort _userCredentialPort;

  CategoryRegistrationUsecase(this._categoryPort, this._registerPresenter, this._userCredentialPort);

  Future<void> execute(CategoryName categoryName) async {
    final userCredential = await _userCredentialPort.get();
    await _categoryPort.save(userCredential!.userid, categoryName);
    getIt<GetCategoryUsecase>().execute();
  }

  Future<void> inputCategoryName(CategoryName categoryName) async {
    _registerPresenter.setCategoryName(categoryName);
  }
}