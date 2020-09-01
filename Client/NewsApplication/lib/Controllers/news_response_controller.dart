import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:NewsApplication/utils/category_enum.dart';
import 'package:NewsApplication/utils/source_enum.dart';

class NewsResponseController {
  NewsResponseService newsResponseService = new NewsResponseService();
  NewsResponseModel news = new NewsResponseModel();

  Future<NewsResponseModel> getNewsBySource(SourceEnum sourceEnum) async {
    //TODO: determine if passing through an enum is proper dart syntax
    try {
      news = await newsResponseService.fetchNewsBySource(sourceEnum.source);
    } catch (e) {
      print("Exception: " + e);
    }
  }

  Future<NewsResponseModel> getNewsByCategory(CategoryEnum categoryEnum) async {
    try {
      news = await newsResponseService
          .fetchNewsByCategory(categoryEnum.toString());
    } catch (e) {
      print("Exception: " + e);
    }
  }
}
