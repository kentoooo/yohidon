import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/state/activity_view_state.dart';
import 'package:yohidon/state/category_list_view_state.dart';
import 'package:yohidon/state/child_category_list_view_state.dart';
import 'package:yohidon/state/home_view_state.dart';
import 'package:yohidon/state/register_view_state.dart';

import '../injector.dart';
import 'categories_page.dart';

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
        itemBuilder: (_, index) => ListTile(
          title: Text(state.childCategoryList.values[index].name),
        ),
      ),
    );
  }
}
