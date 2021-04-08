import 'package:injectable/injectable.dart';
import 'package:yohidon/domain/mailaddress.dart';
import 'package:yohidon/domain/password.dart';
import 'package:yohidon/state/login_view_state.dart';

@injectable
class LoginPresenter {
  final LoginViewState _state;

  LoginPresenter(this._state);

  void setMailAddress(MailAddress mailAddress) {
    _state.emailAddress = mailAddress.value;
    _state.updateComplete();
  }

  void setPassword(Password password) {
    _state.password = password.value;
    _state.updateComplete();
  }
}