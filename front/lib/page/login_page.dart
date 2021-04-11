import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yohidon/domain/mailaddress.dart';
import 'package:yohidon/domain/password.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/state/login_view_state.dart';
import 'package:yohidon/usecase/login/login_usecase.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginViewState>();
    return Scaffold(
        appBar: AppBar(title: Text('Sign in')),
        body: Column(
          children: [
            TextFormField(
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please type some an email';
                }
              },
              onChanged: (input) => getIt<LoginUsecase>().inputMailAddress(MailAddress(input)),
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input!.length < 6) {
                  return '6 character';
                }
              },
              onChanged: (input) => getIt<LoginUsecase>().inputPassword(Password(input)),
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed:() {
                getIt<LoginUsecase>().execute(MailAddress(state.emailAddress!), Password(state.password!), context);
              },
              child: Text('Sign in'),
            )
          ],
        ));
  }
}
