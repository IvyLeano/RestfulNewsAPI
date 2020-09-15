import 'package:NewsApplication/Models/article_model.dart';
import 'article_row_component.dart';

import 'package:flutter/cupertino.dart';

class ArticleRowsComponent extends StatelessWidget {
  ArticleRowsComponent({Key key, this.filter, this.articles})
      : super(key: key);

  final String filter;
  final List<ArticleModel> articles;

  Widget applyNewsFilter() {
    List<Widget> filterRows = new List<Widget>();
    this.articles.forEach((item) {
      filterRows.add(new ArticleRowComponent(article: item));
    });
    return new Column(children: filterRows);
  }

  @override
  Widget build(BuildContext context) {
    return applyNewsFilter();
  }
}
