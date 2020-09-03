import 'dart:convert';

import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:http/http.dart' as http;

class NewsResponseService {
  Future<NewsResponseModel> fetchNewsBySource(String source) async {
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_SOURCE_ENDPOINT, {"source": source});
    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      return NewsResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve news by source.');
    }
  }

  Future<NewsResponseModel> fetchNewsByCategory(String category) async {
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_CATEGORY_ENDPOINT, {"category": category});
    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      return NewsResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to retrieve news by category.');
    }
  }
}
