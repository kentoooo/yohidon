import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/driver/category_json.dart';
import 'package:yohidon/driver/yohidon_api.dart';

abstract class CategoryPort {
  Future<Categories> findAll(UserId userId);
  Future<void> save(UserId userId, CategoryName categoryName);
}

@Injectable(as: CategoryPort)
class CategoryGateway extends CategoryPort {
  @override
  Future<Categories> findAll(UserId userId) async {
    final result = await YohidonApi().getCategories(userId.value);
    return Categories(result.categories.map((e) => Category(CategoryId(e.id), CategoryName(e.name))).toList());
  }

  @override
  Future<void> save(UserId userId, CategoryName categoryName) async {
    await YohidonApi().postCategory(userId.value, PostCategoryJson(categoryName.value));
  }
}