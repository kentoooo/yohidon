import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/port/category_port.dart';
import 'package:yohidon/port/user_credential_port.dart';
import 'package:yohidon/presenter/category_list_presenter.dart';
import 'package:yohidon/presenter/child_category_list_presenter.dart';
import 'package:yohidon/usecase/get_category_usecase.dart';

@injectable
class CategoryRegistrationUsecase {
  final CategoryPort _categoryPort;
  final CategoryListPresenter _categoryListPresenter;
  final ChildCategoryListPresenter _childCategoryListPresenter;
  final UserCredentialPort _userCredentialPort;

  CategoryRegistrationUsecase(this._categoryPort, this._categoryListPresenter, this._childCategoryListPresenter, this._userCredentialPort);

  Future<void> execute(CategoryName categoryName) async {
    final userCredential = await _userCredentialPort.get();
    await _categoryPort.save(userCredential!.userid, categoryName);
    getIt<GetCategoryUsecase>().getCategories();
    getIt<GetCategoryUsecase>().execute();
  }

  Future<void> inputCategoryName(CategoryName categoryName) async {
    _categoryListPresenter.setCategoryName(categoryName);
  }

  Future<void> inputChildCategoryName(CategoryId categoryId, CategoryName categoryName) async {
    _childCategoryListPresenter.setCategoryName(categoryName);
  }

  Future<void> registerChildCategory(CategoryId categoryId, CategoryName categoryName) async {
    final userCredential = await _userCredentialPort.get();
    await _categoryPort.saveChildCategory(userCredential!.userid, categoryId, categoryName);
    getIt<GetCategoryUsecase>().getChildCategories(categoryId);
    getIt<GetCategoryUsecase>().execute();
  }

}