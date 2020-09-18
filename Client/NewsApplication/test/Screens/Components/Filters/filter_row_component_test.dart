import 'package:NewsApplication/Screens/Components/Filters/filter_row_component.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

main() {
  testWidgets('The correct title is displayed on the FilterRowComponent Widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(new MaterialApp(
        home: new Scaffold(body: FilterRowComponent(title: "title"))));
    final titleFinder = find.text("title");
    expect(titleFinder, findsOneWidget);
  });
}
