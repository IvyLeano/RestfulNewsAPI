import 'package:NewsApplication/Screens/Components/Articles/caption_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('The correct header is displayed on the CaptionComponent widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(
            body: CaptionComponent(
                caption: "caption ", author: "author ", date: "date "))));
    final captionFinder = find.text("author date caption ");
    expect(captionFinder, findsOneWidget);
  });
}
