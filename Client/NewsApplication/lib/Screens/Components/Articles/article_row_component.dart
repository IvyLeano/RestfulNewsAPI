import 'dart:async';

import 'package:NewsApplication/Models/article_model.dart';
import 'package:NewsApplication/utils/constants.dart';
import 'caption_component.dart';
import 'title_component.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArticleRowComponent extends StatefulWidget {
  const ArticleRowComponent({Key key, this.article}) : super(key: key);

  final ArticleModel article;

  _ArticleRowComponentState createState() => _ArticleRowComponentState();
}

class _ArticleRowComponentState extends State<ArticleRowComponent> {
  bool isValidAuthor;
  String author;
  String date;
  String description;
  Image image;

  @protected
  void initState() {
    super.initState();
    isValidAuthor =
        widget.article.author != null && !widget.article.author.contains("</a");
    author = !isValidAuthor || widget.article.author == ""
        ? Constants.UNAVAILABLE_AUTHOR
        : widget.article.author;
    date =
        widget.article.publishedAt == null || widget.article.publishedAt == ""
            ? Constants.UNAVAILABLE_DATE
            : widget.article.publishedAt.substring(0, 10);
    description =
        widget.article.description == null || widget.article.description == ""
            ? Constants.UNAVAILABLE_DESCRIPTION
            : widget.article.description;
  }

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
        _launchInBrowser(widget.article.url),
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleComponent(title: widget.article.title),
            widget.article.urlToImage == null
                ? Image.asset('assets/images/ImageUnavailable.jpg')
                : Image(
                    image:
                        CachedNetworkImageProvider(widget.article.urlToImage)),
            CaptionComponent(caption: description, author: author, date: date),
          ]),
    );
  }
}
