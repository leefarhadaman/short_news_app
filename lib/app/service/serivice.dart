// lib/services/news_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/app/model/article_model.dart';

class NewsService {
  static const _apiKey = '33d4c8cf1916447e844fb0a9c2c095f9';
  static const _baseUrl = 'https://newsapi.org/v2';

  Future<List<Article>> fetchTopHeadlines() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['articles'];
      return json.map((data) => Article.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<Article>> fetchShortNews() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/top-headlines?country=us&apiKey=$_apiKey&pageSize=5'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['articles'];
      return json.map((data) => Article.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
