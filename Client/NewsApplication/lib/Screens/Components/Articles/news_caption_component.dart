import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsCaptionComponent extends StatelessWidget {
  NewsCaptionComponent({Key key, this.caption}) : super(key: key);

  final String caption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2.0),
      width: MediaQuery.of(context).size.width * 0.85,
      //height: 35,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            caption,
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
