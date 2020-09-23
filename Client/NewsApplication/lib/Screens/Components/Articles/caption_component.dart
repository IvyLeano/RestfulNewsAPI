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
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            author,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          Text(
            date + "\n",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          Text(
            caption,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
