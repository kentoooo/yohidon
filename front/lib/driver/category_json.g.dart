// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesJson _$CategoriesJsonFromJson(Map<String, dynamic> json) {
  return CategoriesJson(
    (json['categories'] as List<dynamic>)
        .map((e) => CategoryJson.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoriesJsonToJson(CategoriesJson instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

CategoryJson _$CategoryJsonFromJson(Map<String, dynamic> json) {
  return CategoryJson(
    json['id'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$CategoryJsonToJson(CategoryJson instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

PostCategoryJson _$PostCategoryJsonFromJson(Map<String, dynamic> json) {
  return PostCategoryJson(
    json['categoryName'] as String,
  );
}

Map<String, dynamic> _$PostCategoryJsonToJson(PostCategoryJson instance) =>
    <String, dynamic>{
      'categoryName': instance.categoryName,
    };
