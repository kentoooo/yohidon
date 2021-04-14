import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/study_log.dart';
import 'package:yohidon/domain/study_time.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/state/register_view_state.dart';
import 'package:yohidon/usecase/category_registration_usecase.dart';
import 'package:yohidon/usecase/change_slider_usecase.dart';
import 'package:yohidon/usecase/select_category_usecase.dart';
import 'package:yohidon/usecase/study_register_usecase.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterViewState>();
    return Container(
      padding: EdgeInsets.all(24),
      child: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'カテゴリー名',
                ),
                onChanged: (input) {
                  getIt<CategoryRegistrationUsecase>().inputCategoryName(CategoryName(input));
                  },
              ),
              ElevatedButton(
                child: Text('カテゴリー登録'),
                style: ElevatedButton.styleFrom(primary: Colors.orange, onPrimary: Colors.white),
                onPressed: () {
                  getIt<CategoryRegistrationUsecase>().execute(CategoryName(state.categoryName));
                },
              ),
              Divider(
                thickness: 2.0,
              ),
              DropdownButton(
                value: state.selectedItem,
                items: state.selectItems?.values
                    .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                    .toList(),
                onChanged: (SelectItem? item) => {
                  getIt<SelectCategoryUsecase>().execute(item!.toCategory())
                },
              ),
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
              ElevatedButton(
                  child: Text('記録追加'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange, onPrimary: Colors.white),
                  onPressed: () {
                    getIt<StudyRegisterUsecase>().execute(
                      StudyLog(
                        Category(
                          CategoryId(state.selectedItem!.id),
                          CategoryName(state.selectedItem!.name),
                        ),
                        StudyTime(state.rating),
                      ),
                    );
                  })
            ]),
      ),
    );
  }
}

extension SelectItemToCategory on SelectItem {
  Category toCategory() => Category(CategoryId(id), CategoryName(name));
}
