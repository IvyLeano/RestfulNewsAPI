import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_caption_component.dart';

class NewsArticleRowComponent extends StatelessWidget {
  NewsArticleRowComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //NewsResponseController newsResponseController = new NewsResponseController();

    return InkWell(
      onTap: () => {
        print("tap article")
        // navigate to url
      },
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NewsCaptionComponent(caption: "test"),
            Image.network(
              'https://www.pixsy.com/wp-content/uploads/2015/06/copy-image-address.jpg',
            ),
            NewsCaptionComponent(caption: "testasfdddddddddd"),
          ]),
    );
  }
}
