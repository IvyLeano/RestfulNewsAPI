import 'package:NewsApplication/Screens/Components/Filters/news_filter_rows_component.dart';
import 'package:NewsApplication/Screens/Components/header_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key key, this.title}) : super(key: key);

  final String title; // TODO: create a central file for titles and headings

  @override
  Widget build(BuildContext context) {
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
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.075,
                7,
                MediaQuery.of(context).size.width * 0.075,
                7),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderComponent(heading: "News By Source"),
                  NewsFilterRowsComponent(filter: "sources"),
                  HeaderComponent(heading: "News By Category"),
                  NewsFilterRowsComponent(filter: "categories"),
                ]),
          ),
        ),
      ),
    );
  }
}
