import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/state/category_list_view_state.dart';

@injectable
class CategoryListPresenter {
  final CategoryListViewState _state;

  CategoryListPresenter(this._state);

  void setCategories(Categories categories) {
    _state.categoryList = CategoryList(categories
        .map((e) => CategoryListItem(e.categoryId.value, e.categoryName.value))
        .toList());
    _state.updateComplete();
  }
}
