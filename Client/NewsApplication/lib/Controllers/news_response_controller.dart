import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:NewsApplication/utils/constants.dart';

class NewsResponseController {
  NewsResponseService newsResponseService = new NewsResponseService();
  List<ArticleModel> articles = new List<ArticleModel>();

  List<ArticleModel> getNewsBySource() {
    //TODO: determine if passing through an enum is proper dart syntax
    Constants.sources.forEach((key, value) async {
      try {
        NewsResponseModel news =
            await newsResponseService.fetchNewsBySource(value);
        articles.addAll(news.articles);
      } catch (e) {
        print("Exception: " + e);
      }
    });
    return articles;
  }

  List<ArticleModel> getNewsByCategory() {
    //TODO: determine if passing through an enum is proper dart syntax
    Constants.categories.forEach((key, value) async {
      try {
        NewsResponseModel news =
            await newsResponseService.fetchNewsByCategory(value);
        articles.addAll(news.articles);
      } catch (e) {
        print("Exception: " + e);
      }
    });
    return articles;
  }
}
