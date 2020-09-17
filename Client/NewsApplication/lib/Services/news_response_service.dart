import 'dart:convert';

import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:http/http.dart' as http;

class NewsResponseService {
  Future<NewsResponseModel> fetchNewsBySource(http.Client client, String source) async {
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_SOURCE_ENDPOINT, {"source": source});
    final http.Response response = await client
        .get(endpoint, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      NewsResponseModel newsResponseModel = NewsResponseModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
      return newsResponseModel;
    } else {
      throw Exception(
          "Status Code Exception: " + response.statusCode.toString());
    }
  }

  Future<NewsResponseModel> fetchNewsByCategory(http.Client client, String category) async {
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_CATEGORY_ENDPOINT, {"category": category});
    final http.Response response = await client
        .get(endpoint, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      NewsResponseModel newsResponseModel = NewsResponseModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
      return newsResponseModel;
    } else {
      throw Exception(
          "Status Code Exception: " + response.statusCode.toString());
    }
  }
}
