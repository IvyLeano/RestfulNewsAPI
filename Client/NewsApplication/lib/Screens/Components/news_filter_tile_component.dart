import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsFilterTileComponent extends StatelessWidget {
  NewsFilterTileComponent({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return
      Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(color: Colors.lightBlue),
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
    );
  }
}
