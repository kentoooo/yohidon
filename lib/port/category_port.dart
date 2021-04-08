import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/user_id.dart';
import 'package:yohidon/driver/yohidon_api.dart';

abstract class CategoryPort {
  Future<Categories> findAll(UserId userId);
}

@Injectable(as: CategoryPort)
class CategoryGateway extends CategoryPort {
  @override
  Future<Categories> findAll(UserId userId) async {
    final result = await YohidonApi().getCategories(userId.value);
    return Categories(result.categories.map((e) => Category(CategoryId(e.id), CategoryName(e.name))).toList());
  }
}