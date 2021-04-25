import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/state/child_category_list_view_state.dart';

@injectable
class ChildCategoryListPresenter {
  final ChildCategoryListViewState _state;

  ChildCategoryListPresenter(this._state);

  void setChildCategories(Categories categories) {
    _state.childCategoryList = ChildCategoryList(categories
        .map((e) =>
            ChildCategoryListItem(e.categoryId.value, e.categoryName.value))
        .toList());
    _state.updateComplete();
  }
}
