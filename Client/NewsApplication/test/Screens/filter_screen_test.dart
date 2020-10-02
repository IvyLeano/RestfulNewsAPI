import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Screens/Components/Articles/article_rows_component.dart';
import 'package:NewsApplication/Screens/Components/Articles/title_component.dart';
import 'package:NewsApplication/Screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<ArticleModel> articles = new List<ArticleModel>();
  ArticleModel articleModel = new ArticleModel();

  articleModel.author = "author";
  articleModel.title = "title";

  articles.add(articleModel);

  testWidgets('The TitleComponent widget is present on the FilterScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: FilterScreen(
                header: "header", articles: new List<ArticleModel>()))));
    await tester.pumpAndSettle(Duration(seconds: 6));
    expect(find.byType(TitleComponent), findsOneWidget);
  });

  testWidgets('The ArticleRowsComponent widget is present on the FilterScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: FilterScreen(header: "header", articles: articles))));
    await tester.pumpAndSettle(Duration(seconds: 6));
    expect(find.byType(ArticleRowsComponent), findsOneWidget);
  });
}
