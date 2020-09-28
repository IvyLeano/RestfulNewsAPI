import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Screens/Components/Articles/article_rows_component.dart';
import 'package:NewsApplication/Screens/Components/header_component.dart';
import 'package:NewsApplication/Screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('The HeaderComponent widget is present on the FilterScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: FilterScreen(
                header: "header",
                articles: new List<ArticleModel>()))));
    expect(find.byType(HeaderComponent), findsOneWidget);
  });

  testWidgets('The ArticleRowsComponent widget is present on the FilterScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: FilterScreen(
                header: "header",
                articles: new List<ArticleModel>()))));
    expect(find.byType(ArticleRowsComponent), findsOneWidget);
  });
}
