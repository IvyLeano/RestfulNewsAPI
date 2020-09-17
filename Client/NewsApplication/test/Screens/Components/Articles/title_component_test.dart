import 'package:NewsApplication/Screens/Components/Articles/title_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  testWidgets('The correct title is displayed on the TitleComponent Widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(body: TitleComponent(title: "title"))));
    final titleFinder = find.text("title");
    expect(titleFinder, findsOneWidget);
  });
}
