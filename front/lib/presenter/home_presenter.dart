import 'package:injectable/injectable.dart';
import 'package:yohidon/state/home_view_state.dart';

@injectable
class HomePresenter {
  final HomeViewState _state;

  HomePresenter(this._state);
  void setIndex(int index) {
    _state.currentIndex = index;
    _state.updateComplete();
  }
}