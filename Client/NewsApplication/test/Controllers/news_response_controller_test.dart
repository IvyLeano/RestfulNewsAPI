import 'package:NewsApplication/Controllers/news_response_controller.dart';
import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/Models/source_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockHttpResponse extends Mock implements http.Response {}

class MockClient extends Mock implements http.Client {}

class MockService extends Mock implements NewsResponseService {}

void main() {
  MockService newsResponseService = new MockService();
  NewsResponseController newsResponseController = NewsResponseController(
      newsResponseService: newsResponseService, client: new MockClient());
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

  test(
      'When calling getNewsBySource() and request is successful, should set controller articles',
      () async {
    when(newsResponseService.fetchNewsBySource(
            newsResponseController.client, any))
        .thenAnswer((_) async => newsResponseModel);
    await newsResponseController.getNewsBySource("CNN");
    assert(newsResponseController.articles[0].source.id == "CNN");
    assert(newsResponseController.articles[0].source.name == "cnn");
    assert(newsResponseController.articles[1].source.id == "CBC");
    assert(newsResponseController.articles[1].source.name == "cbc");
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
      'When calling getNewsByCategory() and request is successful, should set controller articles',
      () async {
    when(newsResponseService.fetchNewsByCategory(
            newsResponseController.client, any))
        .thenAnswer((_) async => newsResponseModel);
    await newsResponseController.getNewsByCategory("Business");
    assert(newsResponseController.articles[0].source.id == "CNN");
    assert(newsResponseController.articles[0].source.name == "cnn");
    assert(newsResponseController.articles[1].source.id == "CBC");
    assert(newsResponseController.articles[1].source.name == "cbc");
  });
}
