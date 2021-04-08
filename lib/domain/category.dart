import 'package:yohidon/domain/fcc.dart';

class Categories extends FCC<Category> {
  @override
  final List<Category> list;
  Categories(this.list);
}

class Category {
  final CategoryId categoryId;
  final CategoryName categoryName;

  Category(this.categoryId, this.categoryName);
}

class CategoryId {
  final String value;

  CategoryId(this.value);
}

class CategoryName {
  final String value;

  CategoryName(this.value);
}