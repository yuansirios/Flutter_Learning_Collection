/**
 * 可滚动组件
 */
import 'package:flutter/material.dart';
import 'SingleChildScrollViewWidgets.dart';
import 'ListViewWidgets.dart';
import 'GridViewWidgets.dart';
import 'CustomScrollViewWidgets.dart';

class ScrollAbleWidgets extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("可滚动组件"),
      ),
      body: BaseListView(),
    );
  }
}

class BaseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getListData(context),
    );
  }

  final List dataList = [
    {"title": "SingleChildScrollView", "component": SingleChildScrollViewWidgets()},
    {"title": "ListView", "component": ListViewWidgets()},
    {"title": "GridView", "component": GridViewWidgets()},
    {"title": "CustomScrollView和滚动监听", "component": CustomScrollViewWidgets()}
  ];

  List<Widget> _getListData(BuildContext context) {
    List<Widget> list = List();
    for (int i = 0; i < dataList.length; i++) {
      var title = dataList[i]["title"];

      list.add(Column(
        children: <Widget>[
          ListTile(
            title: Text("【$i】$title"),
            onTap: () {
              var component = dataList[i]["component"];
              if (component is Widget) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => dataList[i]["component"]));
              }
            },
          ),
          Divider(height: 1)
        ],
      ));
    }
    return list;
  }
}