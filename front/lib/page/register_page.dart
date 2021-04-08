import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/study_time.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/state/RegisterViewState.dart';
import 'package:yohidon/usecase/change_slider_usecase.dart';
import 'package:yohidon/usecase/select_category_usecase.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterViewState>();
    return Scaffold(
      body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                  DropdownButton(
                    value: state.selectedItem,
                    items: state.selectItems?.values.map((e) => DropdownMenuItem(value: e ,child: Text(e.name))).toList(),
                    onChanged:(SelectItem? item) => {
                      getIt<SelectCategoryUsecase>().execute(item!.toCategory())
                    },
                  ),
                SizedBox(height: 20,),
                Slider(
                  value: state.rating,
                  onChanged: (newRating) {
                    getIt<ChangeSliderUsecase>().execute(StudyTime(newRating));
                  },
                  divisions: 24,
                  min: 0.0,
                  max: 12.0,
                  label: "${state.rating}",
                ),
              ]
            ),
          ),
      ),
    );
  }
}

extension SelectItemToCategory on SelectItem {
  Category toCategory() =>
      Category(CategoryId(id), CategoryName(name));
}