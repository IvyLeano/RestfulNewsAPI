import 'package:NewsApplication/Models/article_model.dart';

class NewsResponseModel {
  final List<ArticleModel> articles;

  NewsResponseModel({this.articles});

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    List<ArticleModel> articles = new List();
    for (Map<String, dynamic> article in json['articles']) {
      articles.add(ArticleModel.fromJson(article));
    }
    return NewsResponseModel(articles: articles);
  }
}
