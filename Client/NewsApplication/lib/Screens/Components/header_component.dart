import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({Key key, this.heading}) : super(key: key);

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 6, 0, 6),
      child: Text(
        heading,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
      ),
    );
  }
}
