import 'dart:convert';
import 'dart:io';

import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:http/http.dart' as http;

class NewsResponseService {
  Future<NewsResponseModel> fetchNewsBySource(String source) async {
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_SOURCE_ENDPOINT, {"source": source});
    var client = new http.Client();
    final http.Response response = await client.get(endpoint);
    if (response.statusCode == 200) {
      print(response.body.toString());
      NewsResponseModel newsResponseModel =
          NewsResponseModel.fromJson(json.decode(response.body));
      return newsResponseModel;
    } else {
      throw HttpException(response.statusCode.toString());
    }
  }

  Future<NewsResponseModel> fetchNewsByCategory(String category) async {
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_CATEGORY_ENDPOINT, {"category": category});
    var client = new http.Client();
    final http.Response response = await client.get(endpoint);
    if (response.statusCode == 200) {
      print(response.body.toString());
      NewsResponseModel newsResponseModel =
          NewsResponseModel.fromJson(json.decode(response.body));
      return newsResponseModel;
    } else {
      throw HttpException(response.statusCode.toString());
    }
  }
}
