import 'package:NewsApplication/Controllers/news_response_controller.dart';
import 'package:NewsApplication/Models/news_response_model.dart';
import 'package:flutter/cupertino.dart';

class NewsArticleRowsComponent extends StatelessWidget {
  NewsArticleRowsComponent({Key key, this.filter}) : super(key: key);

  final String filter;

  Widget applyFilter() {
    List<Widget> filterRows = new List<Widget>();
    NewsResponseController newsResponseController = new NewsResponseController();



    return new Column(children: filterRows);
  }

  @override
  Widget build(BuildContext context) {
    return applyFilter();
  }
}
