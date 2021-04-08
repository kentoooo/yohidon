import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yohidon/main.dart';
import 'package:yohidon/page/register_page.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      setState(() {
        _error = true;
      });
    }
  }

  bool _initialized = false;
  bool _error = false;

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  String? _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Sign in')),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (input) {
                  if (input!.isEmpty) {
                    return 'Please type some an email';
                  }
                },
                onSaved: (input) => _email = input,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                validator: (input) {
                  if (input!.length < 6) {
                    return '6 character';
                  }
                },
                onSaved: (input) => _password = input,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: signIn,
                child: Text('Sign in'),
              )
            ],
          ),
        ));
  }

  Future<void> signIn() async {
    final _formState = _formKey.currentState;
    if(_formState!.validate()) {
      _formState.save();
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email!, password: _password!);
        print(user);
        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
      } catch (e) {
        print(e.toString());
      }
    }
  }
}
