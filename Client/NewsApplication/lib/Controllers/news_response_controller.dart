import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:NewsApplication/utils/constants.dart';

class NewsResponseController {
  NewsResponseService newsResponseService = new NewsResponseService();
  List<NewsResponseModel> news = new List<NewsResponseModel>();

  List<NewsResponseModel> getNewsBySource() {
    //TODO: determine if passing through an enum is proper dart syntax
    Constants.sources.forEach((key, value) async {
      try {
        news.add(await newsResponseService.fetchNewsBySource(value));
      } catch (e) {
        print("Exception: " + e);
      }
    });
    return news;
  }

  List<NewsResponseModel> getNewsByCategory() {
    Constants.sources.forEach((key, value) async {
      try {
        news.add(await newsResponseService.fetchNewsByCategory(value));
      } catch (e) {
        print("Exception: " + e);
      }
    });
    return news;
  }
}
