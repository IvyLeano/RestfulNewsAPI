import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockHttpResponse extends Mock implements http.Response {}

class MockClient extends Mock implements http.Client {}

void main() {
  NewsResponseService newsResponseService = new NewsResponseService();

  // Tests for fetchNewsBySource()
  test('When calling fetchNewsBySource() an http get request is made',
      () async {
    final client = MockClient();
    when(client.get(any, headers: anyNamed("headers")))
        .thenAnswer((_) async => http.Response('{"articles": []}', 200));
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_SOURCE_ENDPOINT, {"source": "CNN"});
    await newsResponseService.fetchNewsBySource(client, "CNN");
    verify(client.get(endpoint, headers: {'Content-Type': 'application/json'}))
        .called(1);
  });

  test(
      'When calling fetchNewsBySource() and request is successful, should return valid response',
      () async {
    final client = MockClient();
    when(client.get(any, headers: anyNamed("headers"))).thenAnswer((_) async =>
        http.Response(
            '{"articles":[{"source":{"id":"cnn","name":"CNN"}}]}', 200));
    NewsResponseModel newsResponseModel =
        await newsResponseService.fetchNewsBySource(client, "CNN");
    assert(newsResponseModel.articles[0].source.id == "cnn");
    assert(newsResponseModel.articles[0].source.name == "CNN");
  });

  // Tests for fetchNewsByCategory()
  test('When calling fetchNewsByCategory() an http get request is made',
      () async {
    final client = MockClient();
    when(client.get(any, headers: anyNamed("headers")))
        .thenAnswer((_) async => http.Response('{"articles": []}', 200));
    final Uri endpoint = new Uri.http(Constants.BASE_URL,
        Constants.NEWS_BY_CATEGORY_ENDPOINT, {"category": "Business"});
    await newsResponseService.fetchNewsByCategory(client, "Business");
    verify(client.get(endpoint, headers: {'Content-Type': 'application/json'}))
        .called(1);
  });

  test(
      'When calling fetchNewsByCategory() and request is successful, should return valid response',
      () async {
    final client = MockClient();
    when(client.get(any, headers: anyNamed("headers"))).thenAnswer((_) async =>
        http.Response(
            '{"articles":[{"source":{"id":"cnn","name":"CNN"}}]}', 200));
    NewsResponseModel newsResponseModel =
        await newsResponseService.fetchNewsByCategory(client, "Business");
    assert(newsResponseModel.articles[0].source.id == "cnn");
    assert(newsResponseModel.articles[0].source.name == "CNN");
  });
}
