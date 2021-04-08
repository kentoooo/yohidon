import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yohidon/driver/category_json.dart';
import 'package:yohidon/driver/study_log_json.dart';

class YohidonApi {

  final endpoint = "yohidon-api-kentoooo.vercel.app";

  Future<CategoriesJson> getCategories(String userId) async {
    final response = await http.get(Uri.https(endpoint, '/users/$userId/categories'));
    return CategoriesJson.fromJson(jsonDecode(response.body));
  }

  Future<void> postStudyLog(StudyLogJson param, String userId) async {
    await http.post(
      Uri.https(endpoint, '/users/$userId/studyLogs'),
      body: json.encode(param.toJson()),
      headers: {"Content-Type": "application/json"},
    );
  }
}