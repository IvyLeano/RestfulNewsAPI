import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'caption_component.dart';
import 'title_component.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleRowComponent extends StatelessWidget {
  ArticleRowComponent({Key key, this.article}) : super(key: key);

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
    bool isValidAuthor =
        article.author != null && !article.author.contains("</a");
    String author =
        !isValidAuthor ? Constants.UNAVAILABLE_AUTHOR : article.author + "\n";
    String date = article.publishedAt == null ? Constants.UNAVAILABLE_DATE : article.publishedAt.substring(0, 10) + "\n\n";
    String description = article.description == null ? Constants.UNAVAILABLE_DESCRIPTION : article.description;

    return InkWell(
      onTap: () => {
        _launchInBrowser(article.url),
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleComponent(title: article.title),
            article.urlToImage == null
                ? Image.asset('assets/images/ImageUnavailable.jpg')
                : Image.network(
                    article.urlToImage,
                  ),
            CaptionComponent(caption: description, author: author, date: date),
          ]),
    );
  }
}
