import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/page/login_page.dart';
import 'package:yohidon/state/activity_view_state.dart';
import 'package:yohidon/state/category_list_view_state.dart';
import 'package:yohidon/state/child_category_list_view_state.dart';
import 'package:yohidon/state/home_view_state.dart';
import 'package:yohidon/state/login_view_state.dart';
import 'package:yohidon/state/register_view_state.dart';

void main() async {
  configureDependencies();
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => getIt<RegisterViewState>()),
          ChangeNotifierProvider(create: (_) => getIt<LoginViewState>()),
          ChangeNotifierProvider(create: (_) => getIt<HomeViewState>()),
          ChangeNotifierProvider(create: (_) => getIt<ActivityViewState>()),
          ChangeNotifierProvider(create: (_) => getIt<CategoryListViewState>()),
          ChangeNotifierProvider(create: (_) => getIt<ChildCategoryListViewState>()),
        ],
        child: LoginPage(),
      ),
    );
  }
}
