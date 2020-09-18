import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Models/source_model.dart';
import 'package:NewsApplication/Screens/Components/Articles/article_row_component.dart';
import 'package:NewsApplication/Screens/Components/Articles/caption_component.dart';
import 'package:NewsApplication/Screens/Components/Articles/title_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main() {

  ArticleModel articleModel = new ArticleModel();
  articleModel.source = new SourceModel();
  articleModel.author = "Miles Kruppa";
  articleModel.title = "TikTok set to become a standalone US company";
  articleModel.description = "News, analysis and comment from the Financial Times, the worldʼs leading global business publication";
  articleModel.url ="https://www.ft.com/content/58eb7c26-2154-477f-af19-19157ae29261";
  articleModel.urlToImage = "https://cdn.cnn.com/cnnnext/dam/assets/200917212139-biden-interruption-town-hall-0917-super-tease.jpg";
  articleModel.publishedAt = "2020-09-15T17:57:00Z";
  articleModel.content = "Keep abreast of significant corporate, financial and political developments around the world.";

  testWidgets('TitleComponent is present on the ArticleRowComponent widget', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Image.network(articleModel.urlToImage),
        ),
      );
      await tester.pumpWidget(new MaterialApp(home: new Scaffold(body: ArticleRowComponent(article: articleModel))));
      expect(find.byType(TitleComponent), findsOneWidget);
    });
  });

  testWidgets('CaptionComponent is present on the ArticleRowComponent widget', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Image.network(articleModel.urlToImage),
        ),
      );
      await tester.pumpWidget(new MaterialApp(home: new Scaffold(body: ArticleRowComponent(article: articleModel))));
      expect(find.byType(CaptionComponent), findsOneWidget);
    });
  });

}