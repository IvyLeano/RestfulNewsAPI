import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/utils/constants.dart';

class NewsResponseController {
  NewsResponseService newsResponseService = new NewsResponseService();
  List<ArticleModel> articles = new List<ArticleModel>();

  Future<bool> getNewsBySource(String value) async {
    //TODO: determine if passing through an enum is proper dart syntax
    String parameter = Constants.sources[value];
    print(parameter);
    try {
      NewsResponseModel news =
          await newsResponseService.fetchNewsBySource(parameter);
      articles.addAll(news.articles);
      return true;
    } catch (e) {
      print("Exception: " + e);
      return false;
    }
  }

  Future<bool> getNewsByCategory(String value) async {
    //TODO: determine if passing through an enum is proper dart syntax
    String parameter = Constants.categories[value];
    print(parameter);
    try {
      NewsResponseModel news =
          await newsResponseService.fetchNewsByCategory(parameter);
      articles.addAll(news.articles);
      return true;
    } catch (e) {
      print("Exception: " + e);
      return false;
    }
  }
}
