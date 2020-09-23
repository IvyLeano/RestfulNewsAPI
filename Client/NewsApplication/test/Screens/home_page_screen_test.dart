import 'package:NewsApplication/Screens/Components/Filters/filter_rows_component.dart';
import 'package:NewsApplication/Screens/Components/header_component.dart';
import 'package:NewsApplication/Screens/home_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('The correct title is displayed on the HomePageScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(body: HomePageScreen(title: "title"))));
    final titleFinder = find.text("title");
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('The HeaderComponent widget is present on the HomePageScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(body: HomePageScreen(title: "title"))));
    expect(find.byType(HeaderComponent), findsNWidgets(2));
  });

  testWidgets('The FilterRowsComponent widget is present on the HomePageScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(body: HomePageScreen(title: "title"))));
    expect(find.byType(FilterRowsComponent), findsNWidgets(2));
  });
}
