import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yohidon/driver/activity_json.dart';
import 'package:yohidon/driver/category_json.dart';
import 'package:yohidon/driver/study_log_json.dart';

class YohidonApi {
  final endpoint = "yohidon-api-kentoooo.vercel.app";

  Future<CategoriesJson> getCategories(String userId) async {
    final response = await http.get(Uri.https(endpoint, '/users/$userId/categories'));
    return CategoriesJson.fromJson(jsonDecode(response.body));
  }

  Future<CategoriesJson> getChildCategories(String categoryId) async {
    final response = await http.get(Uri.https(endpoint, '/categories/$categoryId/children'));
    return CategoriesJson.fromJson(jsonDecode(response.body));
  }

  Future<ActivitiesJson> getActivities() async {
    final response = await http.get(Uri.https(endpoint, '/activities'));
    return ActivitiesJson.fromJson(jsonDecode(response.body));
  }

  Future<void> postStudyLog(StudyLogJson param, String userId) async {
    await http.post(
      Uri.https(endpoint, '/users/$userId/studyLogs'),
      body: json.encode(param.toJson()),
      headers: {"Content-Type": "application/json"},
    );
  }

  Future<void> postCategory(String userId, PostCategoryJson param) async {
    await http.post(
      Uri.https(endpoint, '/users/$userId/categories'),
      body: json.encode(param.toJson()),
      headers: {"Content-Type": "application/json"},
    );
  }

  Future<void> postCategoryChildren(String userId, String categoryId, PostCategoryJson param) async {
    await http.post(Uri.https(endpoint, '/users/$userId/categories/$categoryId/children'),
        body: json.encode(param.toJson()),
        headers: {"Content-Type": "application/json"});
  }
}
