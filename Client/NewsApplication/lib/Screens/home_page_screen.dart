import 'package:NewsApplication/Screens/Components/Filters/filter_rows_component.dart';
import 'package:NewsApplication/Screens/Components/header_component.dart';
import 'package:NewsApplication/utils/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title, style: TextStyle(fontSize: 25)),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.075,
                7,
                MediaQuery.of(context).size.width * 0.075,
                7),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  HeaderComponent(heading: Constants.SOURCE_HEADER),
                  FilterRowsComponent(filter: "sources"),
                  HeaderComponent(heading: Constants.CATEGORY_HEADER),
                  FilterRowsComponent(filter: "categories"),
                ]),
          ),
        ),
      ),
    );
  }
}
