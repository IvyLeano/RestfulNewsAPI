import 'dart:io';

import 'package:NewsApplication/Controllers/news_response_controller.dart';
import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/Models/source_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockNewsResponseService extends Mock implements NewsResponseService {}
class MockClient extends Mock implements http.Client {}

void main() {
  MockNewsResponseService mockNewsResponseService = new MockNewsResponseService();
  NewsResponseController newsResponseController = NewsResponseController(newsResponseService: mockNewsResponseService);
  NewsResponseModel newsResponseModel = new NewsResponseModel();
  List<ArticleModel> articles = new List<ArticleModel>();
  SourceModel sourceModel1 = new SourceModel();
  SourceModel sourceModel2 = new SourceModel();

  sourceModel1.id = "CNN";
  sourceModel1.name = "cnn";

  sourceModel2.id = "CBC";
  sourceModel2.name = "cbc";

  ArticleModel articleModel1 = new ArticleModel();
  ArticleModel articleModel2 = new ArticleModel();

  articleModel1.source = sourceModel1;
  articleModel2.source = sourceModel2;

  articles.add(articleModel1);
  articles.add(articleModel2);

  newsResponseModel.articles = articles;

  // Tests for fetchNewsBySource()
  test(
      'When calling getNewsBySource() if source is null, should throw exception',
      () async {
    expect(() => newsResponseController.getNewsBySource(null), throwsException);
    expect(() => newsResponseController.getNewsBySource(""), throwsException);
  });

  test('When calling getNewsBySource() if source is valid, should return true',
      () async {
    expect(await newsResponseController.getNewsBySource("CNN"), true);
  });

  // TODO: test happy path test
  test(
      'When calling getNewsBySource() if source is valid, should set correct articles',
      () async {
      when(mockNewsResponseService.fetchNewsBySource(new http.Client(), "CNN")).thenAnswer((_) async => newsResponseModel);
      await newsResponseController.getNewsBySource("source");
      verify(newsResponseController.articles[0].source.id == "CNN");
  });

  // Tests for fetchNewsByCategory()
  test(
      'When calling getNewsByCategory() if category is null, should throw exception',
      () async {
    expect(
        () => newsResponseController.getNewsByCategory(null), throwsException);
    expect(() => newsResponseController.getNewsByCategory(""), throwsException);
  });

  test(
      'When calling getNewsByCategory() if category is valid, should return true',
      () async {
    expect(await newsResponseController.getNewsByCategory("Business"), true);
  });
}
