import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter/material.dart';

import 'Screens/home_page_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News API',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePageScreen(title: Constants.APP_BAR_TITLE),
    );
  }
}
