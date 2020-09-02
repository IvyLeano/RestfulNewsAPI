import 'package:NewsApplication/Screens/Components/header_component.dart';
import 'package:NewsApplication/Screens/news_filter_screen.dart';
import 'package:NewsApplication/utils/category_enum.dart';
import 'package:NewsApplication/utils/source_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key key, this.title}) : super(key: key);

  final String title; // TODO: create a central file for titles and headings

  @override
  Widget build(BuildContext context) {
    List<String> sources = new List<String>();
    List<String> categories = new List<String>();

    SourceEnum.values.forEach((value) => sources
        .add(value.toString().substring(value.toString().indexOf('.') + 1)));
    CategoryEnum.values.forEach((value) => categories
        .add(value.toString().substring(value.toString().indexOf('.') + 1)));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(this.title,
            style: TextStyle(
                fontSize: 25)), // TODO: add size style to central file
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderComponent(heading: "News By Source"),
                  NewsFilterScreen(filters: sources),
                  HeaderComponent(heading: "News By Category"),
                  NewsFilterScreen(filters: categories),
                ]),
          ),
        ),
      ),
    );
  }
}
