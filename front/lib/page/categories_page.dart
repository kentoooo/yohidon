import 'package:flutter/material.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/page/child_category_list_page.dart';
import 'package:yohidon/state/category_list_view_state.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/state/child_category_list_view_state.dart';
import 'package:yohidon/usecase/get_category_usecase.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CategoryListViewState>();

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Color(0xff7367F0),
        title: Text('Yohidon',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            )),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: state.categoryList.values.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(state.categoryList.values[index].name),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            getIt<GetCategoryUsecase>().getChildCategories(CategoryId(state.categoryList.values[index].id));
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MultiProvider(
                      providers: [
                        ChangeNotifierProvider.value(value: getIt<ChildCategoryListViewState>(), child: ChildCategoryListPage(),),
                      ],
                      builder: (context, child) => ChildCategoryListPage(),
                    ),
                ),
            );
          },
        ),
      ),
    );
  }
}
