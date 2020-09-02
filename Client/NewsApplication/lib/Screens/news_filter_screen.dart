
import 'package:NewsApplication/Screens/Components/news_filter_tile_component.dart';
import 'package:NewsApplication/utils/source_enum.dart';
import 'package:flutter/cupertino.dart';

class NewsFilterScreen extends StatelessWidget {
  NewsFilterScreen({Key key, this.filters}) : super(key: key);

  final List<String> filters;

  Widget getFilterTiles() {
    List<Widget> filterRows = new List<Widget>();

    for(String filter in filters){
      filterRows.add(new NewsFilterTileComponent(title: filter));
    }
    return new Column(children: filterRows);
  }

  @override
  Widget build(BuildContext context) {
    return getFilterTiles();  // TODO: on-click events
  }
}