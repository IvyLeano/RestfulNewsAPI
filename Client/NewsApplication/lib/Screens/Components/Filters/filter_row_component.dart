import 'package:NewsApplication/Controllers/news_response_controller.dart';
import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/Screens/filter_screen.dart';
import 'package:NewsApplication/utils/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterRowComponent extends StatelessWidget {
  FilterRowComponent({Key key, this.title}) : super(key: key);

  final String title;
  final NewsResponseController newsController = new NewsResponseController();

  Future loadNews() async {
    if (Constants.sources.containsKey(title)) {
      await newsController.getNewsBySource(title);
    } else {
      await newsController.getNewsByCategory(title);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ArticleModel> articles = new List<ArticleModel>();
    return InkWell(
      onTap: () => {
        loadNews().whenComplete(() => {
              articles = newsController.articles,
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FilterScreen(header: title, articles: articles),
                ),
              ),
            })
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.0),
        width: MediaQuery.of(context).size.width * 0.85,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            color: Colors.black12),
        child: Center(
          child: Text(
            title,
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
