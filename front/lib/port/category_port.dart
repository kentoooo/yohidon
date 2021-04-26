import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/driver/category_json.dart';
import 'package:yohidon/driver/yohidon_api.dart';

abstract class CategoryPort {
  Future<Categories> findAll(UserId userId);
  Future<Categories> findChildCategories(CategoryId categoryId);
  Future<void> save(UserId userId, CategoryName categoryName);
  Future<void> saveChildCategory(UserId userId, CategoryId categoryId, CategoryName categoryName);
}

@Injectable(as: CategoryPort)
class CategoryGateway extends CategoryPort {
  @override
  Future<Categories> findAll(UserId userId) async {
    final result = await YohidonApi().getCategories(userId.value);
    return _toCategories(result);
  }

  @override
  Future<Categories> findChildCategories(CategoryId categoryId) async {
    final result = await YohidonApi().getChildCategories(categoryId.value);
    return _toCategories(result);
  }

  @override
  Future<void> save(UserId userId, CategoryName categoryName) async {
    await YohidonApi().postCategory(userId.value, PostCategoryJson(categoryName.value));
  }

  Categories _toCategories(CategoriesJson json) => Categories(json.categories.map((e) => _toCategory(e)).toList());
  Category _toCategory(CategoryJson json) => Category(CategoryId(json.id), CategoryName(json.name));

  @override
  Future<void> saveChildCategory(UserId userId, CategoryId categoryId, CategoryName categoryName) async {
    await YohidonApi().postCategoryChildren(userId.value, categoryId.value, PostCategoryJson(categoryName.value));
  }

}