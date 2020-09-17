import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:http/http.dart' as http;

class NewsResponseController {
  final NewsResponseService newsResponseService;
  final http.Client client;
  List<ArticleModel> articles = new List<ArticleModel>();

  NewsResponseController({this.newsResponseService, this.client}); // TODO: remove constructor? (used for testing purposes only)

  Future<bool> getNewsBySource(String value) async {
    if (value == null || value.isEmpty) {
      throw Exception("Invalid source");
    }
    String parameter = Constants.sources[value];
    try {
      NewsResponseModel news =
          await newsResponseService.fetchNewsBySource(client, parameter);
      articles.addAll(news.articles);
      return true;
    } catch (e) {
      print("Exception: " + e);
      return false;
    }
  }

  Future<bool> getNewsByCategory(String value) async {
    if (value == null || value.isEmpty) {
      throw Exception("Invalid source");
    }
    String parameter = Constants.categories[value];
    try {
      NewsResponseModel news =
          await newsResponseService.fetchNewsByCategory(client, parameter);
      articles.addAll(news.articles);
      return true;
    } catch (e) {
      print("Exception: " + e);
      return false;
    }
  }
}
