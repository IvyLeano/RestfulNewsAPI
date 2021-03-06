import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Components/Articles/article_rows_component.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'Components/Articles/title_component.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key key, this.header, this.articles}) : super(key: key);

  final String header;
  final List<ArticleModel> articles;

  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen>
    with TickerProviderStateMixin {
  bool isLoading;
  bool isArticlesEmpty;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
      isArticlesEmpty = widget.articles.isEmpty;
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
        automaticallyImplyLeading: !isLoading,
        centerTitle: true,
        title: Text(widget.header + " News", style: TextStyle(fontSize: 25)),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: isArticlesEmpty
              ? TitleComponent(title: Constants.UNAVAILABLE_NEWS_FEED)
              : Column(children: <Widget>[
                  if (isLoading)
                    SpinKitCircle(
                      color: Colors.green,
                      size: 30.0,
                      controller: AnimationController(
                          vsync: this, duration: new Duration(seconds: 1)),
                    ),
                  ArticleRowsComponent(articles: widget.articles),
                ]),
        ),
      ),
    );
  }
}
