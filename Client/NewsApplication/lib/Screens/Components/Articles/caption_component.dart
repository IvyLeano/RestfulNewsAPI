import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CaptionComponent extends StatelessWidget {
  CaptionComponent({Key key, this.caption, this.author, this.date})
      : super(key: key);

  final String caption;
  final String author;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      width: MediaQuery.of(context).size.width * 0.85,
      //height: 35,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(children: <Widget>[
            Text(
              author + date + caption,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
