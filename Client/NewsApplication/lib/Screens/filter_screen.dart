import 'dart:async';

import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Screens/Components/loading_spinner_dialog.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/Articles/article_rows_component.dart';
import 'Components/header_component.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key key, this.isLoading, this.header, this.articles})
      : super(key: key);

  final bool isLoading;
  final String header;
  final List<ArticleModel> articles;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> with TickerProviderStateMixin {

  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.APP_BAR_TITLE, style: TextStyle(fontSize: 25)),
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
                  HeaderComponent(heading: widget.header),
                  ArticleRowsComponent(articles: widget.articles),
                ]),
          ),
        ),
      ),
    );
  }
}
