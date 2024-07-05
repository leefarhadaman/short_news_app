// lib/app/service/youtube_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/app/model/youtube_video_model.dart';

class YoutubeService {
  static const _apiKey = 'AIzaSyDqQhLCxGj_dFmaUfjBYGYR-4izjtQLaGU'; // Replace with your YouTube API key
  static const _baseUrl = 'https://www.googleapis.com/youtube/v3';

  Future<List<YoutubeVideo>> fetchNewsShorts(String channelId) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search?part=snippet&channelId=$channelId&type=video&key=$_apiKey&maxResults=10'), // Adjust maxResults as needed
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> videoList = jsonResponse['items'];
      return videoList.map((data) => YoutubeVideo.fromJson(data)).toList();
    } else {
      print('API Error: ${response.statusCode} - ${response.reasonPhrase}');
      print('API Response: ${response.body}');
      throw Exception('Failed to load videos: ${response.statusCode}');
    }
  }

}
