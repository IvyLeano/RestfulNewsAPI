import 'package:NewsApplication/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'filter_row_component.dart';

class FilterRowsComponent extends StatelessWidget {
  FilterRowsComponent({Key key, this.filter}) : super(key: key);

  final String filter;

  Widget applyFilter() {
    List<Widget> filterRows = new List<Widget>();

    if (filter == "sources") {
      Constants.sources.forEach((key, value) {
        filterRows.add(new FilterRowComponent(title: key));
      });
    } else {
      Constants.categories.forEach((key, value) {
        filterRows.add(new FilterRowComponent(title: key));
      });
    }
    return new Column(children: filterRows);
  }

  @override
  Widget build(BuildContext context) {
    return applyFilter();
  }
}
