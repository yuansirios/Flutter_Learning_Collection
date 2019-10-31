
import 'package:flutter/material.dart';
import 'WillPopScopeWidgets.dart';
import 'InheritedWidgets.dart';
import 'FutureWidgets.dart';
import 'AlertDialogWidgets.dart';

class FunctionalWidgets extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能型组件"),
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
    {"title": "导航返回拦截（WillPopScope）", "component": WillPopScopeWidgets()},
    {"title": "数据共享（InheritedWidget）", "component": InheritedWidgets()},
    {"title": "异步UI更新（FutureBuilder、StreamBuilder）", "component": FutureWidgets()},
    {"title": "对话框详解", "component": AlertDialogWidgets()},
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
