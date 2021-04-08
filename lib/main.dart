import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/page/register_page.dart';
import 'package:yohidon/state/RegisterViewState.dart';
import 'package:yohidon/usecase/get_category_usecase.dart';

void main() async {
  configureDependencies();
  await getIt<GetCategoryUsecase>().execute();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        ],
        child: RegisterPage(),
      ) ,
    );
  }
}
