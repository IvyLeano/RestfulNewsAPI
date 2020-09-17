import 'package:NewsApplication/Screens/Components/header_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('The correct header is displayed on the HeaderComponent Widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(body: HeaderComponent(heading: "heading"))));
    final headingFinder = find.text("heading");
    expect(headingFinder, findsOneWidget);
  });
}
