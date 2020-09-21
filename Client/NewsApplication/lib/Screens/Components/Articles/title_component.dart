import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  TitleComponent({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      margin: EdgeInsets.fromLTRB(0.0, 3.0, 0.0, 0.0),
      width: MediaQuery.of(context).size.width * 0.85,
      //height: 35,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
