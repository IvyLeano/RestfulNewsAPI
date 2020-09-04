import 'package:NewsApplication/Models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_caption_component.dart';

class NewsArticleRowComponent extends StatelessWidget {
  NewsArticleRowComponent({Key key, this.article}) : super(key: key);

  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        print("tap article")
        // navigate to url
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NewsCaptionComponent(caption: article.title),
            Image.network(
              article.urlToImage,
            ),
            NewsCaptionComponent(caption: article.description),
          ]),
    );
  }
}
