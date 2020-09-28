import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/Articles/article_rows_component.dart';
import 'Components/header_component.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key key, this.header, this.articles}) : super(key: key);

  final String header;
  final List<ArticleModel> articles;

  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with SingleTickerProviderStateMixin {
  bool isLoading;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    endAnimation();
  }

  void endAnimation() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
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
                  if (isLoading)
                    SpinKitCircle(
                      color: Colors.green,
                      size: 30.0,
                      controller: AnimationController(
                          vsync: this, duration: new Duration(seconds: 1)),
                    ),
                  HeaderComponent(heading: widget.header),
                  ArticleRowsComponent(articles: widget.articles),
                ]),
          ),
        ),
      ),
    );
  }
}
