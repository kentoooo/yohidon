import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/state/child_category_list_view_state.dart';
import 'package:yohidon/usecase/category_registration_usecase.dart';

import '../injector.dart';

class ChildCategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<ChildCategoryListViewState>();
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
        itemCount: state.childCategoryList.values.length,
        itemBuilder: (_, index) => Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                )
            ),
          ),
          child: ListTile(
            title: Text(state.childCategoryList.values[index].name),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                content: TextField(
                  onChanged: ((input) => {
                        getIt<CategoryRegistrationUsecase>()
                            .inputChildCategoryName(
                                CategoryId(state.parentCategoryId),
                                CategoryName(input))
                      }),
                ),
                actions: [
                  TextButton(
                    child: Text('キャンセル'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: Text('登録'),
                    onPressed: () {
                      getIt<CategoryRegistrationUsecase>()
                          .registerChildCategory(
                              CategoryId(state.parentCategoryId),
                              CategoryName(state.categoryName));
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
