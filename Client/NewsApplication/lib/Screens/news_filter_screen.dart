import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/Articles/news_article_rows_component.dart';
import 'Components/header_component.dart';

class NewsFilterScreen extends StatelessWidget {
  NewsFilterScreen({Key key, this.filter}) : super(key: key);

  final String filter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TopNewsHeadlines",
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
                  HeaderComponent(heading: filter),
                  NewsArticleRowsComponent(filter: filter),
                ]),
          ),
        ),
      ),
    );
  }
}
