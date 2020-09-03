import 'package:NewsApplication/Models/source_model.dart';

class ArticleModel {
  final SourceModel source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ArticleModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: json['source'] as SourceModel,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['title'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      publishedAt: json['publishedAt'] as String,
      content: json['content'] as String,
    );
  }
}
