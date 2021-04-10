import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/domain/mailaddress.dart';
import 'package:yohidon/domain/password.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/page/home_page.dart';
import 'package:yohidon/page/register_page.dart';
import 'package:yohidon/port/user_credential_port.dart';
import 'package:yohidon/presenter/login_presenter.dart';
import 'package:yohidon/state/home_view_state.dart';
import 'package:yohidon/state/register_view_state.dart';
import 'package:yohidon/usecase/get_category_usecase.dart';

@injectable
class LoginUsecase {

  final UserCredentialPort _userCredentialPort;
  final LoginPresenter _presenter;

  LoginUsecase(this._userCredentialPort, this._presenter);

  Future<void> execute(MailAddress mailAddress, Password password, BuildContext context) async {
    final userCredential = await _userCredentialPort.authn(mailAddress, password);
    _userCredentialPort.save(userCredential);
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(create: (_) => getIt<RegisterViewState>()),
                ChangeNotifierProvider(create: (_) => getIt<HomeViewState>()),
              ],
            builder: (context, child) => HomePage(),
          )
        )
    );
    await getIt<GetCategoryUsecase>().execute();
  }

  void inputMailAddress(MailAddress mailAddress) =>
      _presenter.setMailAddress(mailAddress);

  void inputPassword(Password password) =>
      _presenter.setPassword(password);

}