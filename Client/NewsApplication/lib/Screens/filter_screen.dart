import 'dart:async';

import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/Articles/article_rows_component.dart';
import 'Components/header_component.dart';
import 'Dialogs/loading_spinner_dialog.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key key, this.header, this.articles, this.isLoading})
      : super(key: key);

  final String header;
  final List<ArticleModel> articles;
  final bool isLoading;

  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    super.initState();
    loadingSpinner(context);
  }

  void loadingSpinner(BuildContext context) {
    if (widget.isLoading) {
      loadingSpinnerDialog(context);
      Future.delayed(
        Duration(seconds: 3),
        () => Navigator.pop(context),
      );
    }
  }

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
