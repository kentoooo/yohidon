import 'package:json_annotation/json_annotation.dart';

part 'category_json.g.dart';

@JsonSerializable()
class CategoriesJson {
  final List<CategoryJson> categories;

  factory CategoriesJson.fromJson(Map<String, dynamic> json) => _$CategoriesJsonFromJson(json);

  CategoriesJson(this.categories);
}

@JsonSerializable()
class CategoryJson {
  final String id;
  final String name;

  factory CategoryJson.fromJson(Map<String, dynamic> json) => _$CategoryJsonFromJson(json);

  CategoryJson(this.id, this.name);
}

@JsonSerializable()
class PostCategoryJson {
  final String categoryName;

  Map<String, dynamic> toJson() => _$PostCategoryJsonToJson(this);

  PostCategoryJson(this.categoryName);
}