import 'package:NewsApplication/Screens/Components/Articles/caption_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('The correct caption is displayed on the CaptionComponent widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: CaptionComponent(
                caption: "caption", author: "author", date: "date"))));
    final captionFinder = find.text("caption");
    final authorFinder = find.text("author");
    final dateFinder = find.text("date\n");

    expect(captionFinder, findsOneWidget);
    expect(authorFinder, findsOneWidget);
    expect(dateFinder, findsOneWidget);
  });
}
