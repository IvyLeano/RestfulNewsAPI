import 'package:NewsApplication/Models/article_model.dart';

class NewsResponseModel {
  final List<ArticleModel> articles;

  NewsResponseModel({this.articles});

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      articles: json['articles'] as List<ArticleModel>,
    );
  }
}
