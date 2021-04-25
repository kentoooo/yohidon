import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/page/activity_page.dart';
import 'package:yohidon/page/categories_page.dart';
import 'package:yohidon/page/record_page.dart';
import 'package:yohidon/page/register_page.dart';
import 'package:yohidon/state/activity_view_state.dart';
import 'package:yohidon/state/category_list_view_state.dart';
import 'package:yohidon/state/home_view_state.dart';
import 'package:yohidon/state/register_view_state.dart';
import 'package:yohidon/usecase/change_page_usecase.dart';
import 'package:yohidon/usecase/get_category_usecase.dart';

class HomePage extends StatelessWidget {

  List _pageList = [RecordPage(), RegisterPage(), ActivityPage()];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeViewState>();
    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.light,
          backgroundColor: Color(0xff7367F0),
          title: Text(
              'Yohidon',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              )
          ),
          centerTitle: false,
          actions: [
            IconButton(icon: Icon(Icons.add_circle), iconSize: 30.0, color: Colors.black , onPressed: () {

              getIt<GetCategoryUsecase>().getCategories();

              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => MultiProvider(
                        providers: [
                          ChangeNotifierProvider.value(value: getIt<CategoryListViewState>(), child: CategoriesPage(),),
                        ],
                        builder: (context, child) => CategoriesPage(),
                      )
                  )
              );
            },),
          ],
      ),
      body: _pageList.elementAt(state.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart_outlined), label: '記録'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: '登録'),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'アクティビティ')
        ],
        currentIndex: state.currentIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => getIt<ChangePageUsecase>().execute(index),
      ),
    );
  }
}