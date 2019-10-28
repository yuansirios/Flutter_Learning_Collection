/**
 * 布局类组件
 */
import 'package:flutter/material.dart';

class LayoutWidgets extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("布局类组件"),
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
    {"title": "线性布局（Row和Column）", "component": ""},
    {"title": "弹性布局（Flex）", "component": ""},
    {"title": "流式布局（Wrap、Flow）", "component": ""},
    {"title": "层叠布局 (Stack、Positioned)", "component": ""},
    {"title": "对齐与相对定位（Align）", "component": "TextFieldDemo()"}
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
