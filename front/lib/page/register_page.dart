import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yohidon/domain/category.dart';
import 'package:yohidon/domain/memo.dart';
import 'package:yohidon/domain/study_log.dart';
import 'package:yohidon/domain/study_time.dart';
import 'package:yohidon/injector.dart';
import 'package:yohidon/state/register_view_state.dart';
import 'package:yohidon/usecase/change_memo_usecase.dart';
import 'package:yohidon/usecase/change_slider_usecase.dart';
import 'package:yohidon/usecase/select_category_usecase.dart';
import 'package:yohidon/usecase/study_register_usecase.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegisterViewState>();
    return Container(
      padding: EdgeInsets.all(36),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('親カテゴリー'),
                  DropdownButton(
                    isExpanded: true,
                    value: state.selectedItem,
                    items: state.selectItems?.values
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e.name)))
                        .toList(),
                    onChanged: (SelectItem? item) => {
                      getIt<SelectCategoryUsecase>().execute(item!.toCategory())
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('子カテゴリー'),
                  DropdownButton(
                    isExpanded: true,
                    value: state.selectedChildCategory,
                    items: state.childCategories?.values
                        .map((e) =>
                            DropdownMenuItem(value: e, child: Text(e.name)))
                        .toList(),
                    onChanged: (SelectItem? item) => {
                      getIt<SelectCategoryUsecase>()
                          .selectChildCategory(item!.toCategory())
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: TextField(
                textInputAction: TextInputAction.done,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'メモ',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                onChanged: (input) {
                  getIt<ChangeMemoUsecase>().execute(Memo(input));
                },
              ),
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
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                  minimumSize: Size(150, 50)),
              onPressed: () {
                showCupertinoDialog(
                  context: context,
                  builder: (_) => CupertinoAlertDialog(
                    content: Text(state.selectedChildCategory!.id != ""
                        ? "「${state.selectedItem!.name}」の「${state.selectedChildCategory!.name}」\n${state.rating}時間で登録します"
                        : "「${state.selectedItem!.name}」\n${state.rating}時間で登録します"),
                    actions: [
                      CupertinoDialogAction(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text("Yes"),
                        onPressed: () {
                          getIt<StudyRegisterUsecase>().execute(
                            StudyLog.of(
                              ParentCategory(
                                CategoryId(state.selectedItem!.id),
                                CategoryName(state.selectedItem!.name),
                              ),
                              ChildCategory(
                                CategoryId(state.selectedChildCategory!.id),
                                CategoryName(state.selectedChildCategory!.name),
                              ),
                              Memo(state.memo),
                              StudyTime(state.rating),
                            ),
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension SelectItemToCategory on SelectItem {
  Category toCategory() => Category(CategoryId(id), CategoryName(name));
}
