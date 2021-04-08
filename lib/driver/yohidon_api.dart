import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yohidon/driver/category_json.dart';

class YohidonApi {
  Future<CategoriesJson> getCategories(String userId) async {
    final response = await http.get(Uri.https("yohidon-api-kentoooo.vercel.app", '/users/$userId/categories'));
    return CategoriesJson.fromJson(jsonDecode(response.body));
  }
}