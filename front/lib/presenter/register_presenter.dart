import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/memo.dart';
import 'package:yohidon/domain/study_time.dart';
import 'package:yohidon/state/register_view_state.dart';

@injectable
class RegisterPresenter {
  final RegisterViewState _state;

  RegisterPresenter(this._state);

  void setCategories(Categories categories) {
    _state.selectItems = SelectItems(categories.list.map((e) => SelectItem(e.categoryId.value, e.categoryName.value)).toList());
    _state.selectedItem = SelectItem(categories.first.categoryId.value, categories.first.categoryName.value);
    _state.updateComplete();
  }

  void setSelectedCategory(Category category) {
    _state.selectedItem = SelectItem(category.categoryId.value, category.categoryName.value);
    _state.updateComplete();
  }

  void setRate(StudyTime studyTime) {
    _state.rating = studyTime.value;
    _state.updateComplete();
  }

  void setCategoryName(CategoryName categoryName) {
    _state.categoryName = categoryName.value;
    _state.updateComplete();
  }

  void setMemo(Memo memo) {
    _state.memo = memo.value;
    _state.updateComplete();
  }
}

