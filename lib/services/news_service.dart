import 'package:dio/dio.dart';
import 'dart:developer';

class NewsService {
  static Future<List<dynamic>> fetchNews() async {
    var dio = Dio();
    try {
      final response = await dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          'q': 'Tesla',
          'apiKey': 'bdcfada6c1914076b9d24f1202a3a881',
        },
      );

      if (response.statusCode == 200) {
        return response.data['articles'];
      } else {
        return [];
      }
    } catch (e) {
      log('Error: $e');
      return [];
    }
  }
}
