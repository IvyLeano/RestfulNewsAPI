import 'package:NewsApplication/Controllers/news_response_controller.dart';
import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter/cupertino.dart';

import 'news_article_row_component.dart';

class NewsArticleRowsComponent extends StatelessWidget {
  NewsArticleRowsComponent({Key key, this.filter}) : super(key: key);

  final String filter;

  Widget applyFilter(List<ArticleModel> articles) {
    List<Widget> filterRows = new List<Widget>();
    articles.forEach((item) {
      filterRows.add(new NewsArticleRowComponent(article: item));
    });
    return new Column(children: filterRows);
  }

  List<ArticleModel> getFilteredNews() {
    NewsResponseController newsController = new NewsResponseController();
    return Constants.sources.containsKey(filter)
        ? newsController.getNewsBySource()
        : newsController.getNewsByCategory();
  }

  @override
  Widget build(BuildContext context) {
    List<ArticleModel> news = getFilteredNews();
    return applyFilter(news);
  }
}
