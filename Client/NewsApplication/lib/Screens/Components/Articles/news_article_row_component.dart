import 'package:NewsApplication/Models/article_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_caption_component.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsArticleRowComponent extends StatelessWidget {
  NewsArticleRowComponent({Key key, this.article}) : super(key: key);

  final ArticleModel article;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        _launchInBrowser(article.url),
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
