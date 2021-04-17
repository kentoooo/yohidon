import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(),
        ),
        Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomRight,
                colors: [
                  const Color(0xffce9ffc),
                  const Color(0xff7367f0),
                ],
              ),
            ),
            child: Column(
              children: [
                Flexible(
                  child: Center(
                    child: Text(
                      'Yohidon',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextInputField(FontAwesomeIcons.envelope, 'Mail address',
                        TextInputType.emailAddress, TextInputAction.next),
                    PasswordInput(FontAwesomeIcons.lock, 'Password',
                        TextInputType.name, TextInputAction.done),
                    SizedBox(
                      height: 25,
                    ),
                    _buildLoginButton(context, state),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ));
  }

  Widget _buildLoginButton(BuildContext context, LoginViewState state) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.lightBlueAccent,
      ),
      child: FlatButton(
          onPressed: () {
            getIt<LoginUsecase>().execute(MailAddress(state.emailAddress!),
                Password(state.password!), context);
          },
          child: Text(
            'Login',
            style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                height: 1.5,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}

class TextInputField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  TextInputField(this.icon, this.hint, this.inputType, this.inputAction);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            onChanged: (input) =>
                getIt<LoginUsecase>().inputMailAddress(MailAddress(input)),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              hintText: 'Mail address',
              hintStyle:
                  TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
            ),
            style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final IconData icon;
  final String hint;
  final TextInputType inputType;
  final TextInputAction inputAction;

  PasswordInput(this.icon, this.hint, this.inputType, this.inputAction);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: size.height * 0.08,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextField(
            onChanged: (input) =>
                getIt<LoginUsecase>().inputPassword(Password(input)),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.white,
                ),
              ),
              hintText: hint,
              hintStyle:
                  TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
            ),
            obscureText: true,
            style: TextStyle(fontSize: 22, color: Colors.white, height: 1.5),
            keyboardType: inputType,
            textInputAction: inputAction,
          ),
        ),
      ),
    );
  }
}
