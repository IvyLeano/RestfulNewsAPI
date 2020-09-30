import 'dart:async';

import 'package:NewsApplication/Controllers/news_response_controller.dart';
import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Screens/filter_screen.dart';
import 'package:NewsApplication/Services/news_response_service.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterRowComponent extends StatefulWidget {
  FilterRowComponent({Key key, this.title}) : super(key: key);

  final String title;
  final NewsResponseController newsController = new NewsResponseController(
      newsResponseService: new NewsResponseService(),
      client: new http.Client());

  _FilterRowComponentState createState() => _FilterRowComponentState();
}

class _FilterRowComponentState extends State<FilterRowComponent>
    with TickerProviderStateMixin {
  bool isLoading;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  void setIsLoading(bool loading) {
    setState(() {
      this.isLoading = loading;
    });
  }

  Future<void> loadNews() async {
    if (Constants.sources.containsKey(widget.title)) {
      await widget.newsController.getNewsBySource(widget.title);
    } else {
      await widget.newsController.getNewsByCategory(widget.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ArticleModel> articles = new List<ArticleModel>();
    return InkWell(
      onTap: () => {
        setIsLoading(true),
        loadNews().whenComplete(() => {
              articles = widget.newsController.articles,
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FilterScreen(header: widget.title, articles: articles),
                ),
              ),
              setIsLoading(false),
            }),
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            color: Colors.black12),
        child: Center(
          child: isLoading
              ? SpinKitCircle(
                  color: Colors.green,
                  size: 30.0,
                  controller: AnimationController(
                      vsync: this, duration: new Duration(seconds: 1)),
                )
              : Text(
                  widget.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
        ),
      ),
    );
  }
}
