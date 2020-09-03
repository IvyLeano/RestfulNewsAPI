import 'package:NewsApplication/Screens/news_filter_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFilterRowComponent extends StatelessWidget {
  NewsFilterRowComponent({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsFilterScreen(filter: title),
          ),
        ),
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
