import 'package:NewsApplication/Models/article_model.dart';
import 'package:flutter/cupertino.dart';

import 'news_article_row_component.dart';

class NewsArticleRowsComponent extends StatelessWidget {
  const NewsArticleRowsComponent({Key key, this.filter, this.articles})
      : super(key: key);

  final String filter;
  final List<ArticleModel> articles;

  Widget applyFilter() {
    List<Widget> filterRows = new List<Widget>();
    this.articles.forEach((item) {
      filterRows.add(new NewsArticleRowComponent(article: item));
    });
    return new Column(children: filterRows);
  }

  @override
  Widget build(BuildContext context) {
    return applyFilter();
  }
}
