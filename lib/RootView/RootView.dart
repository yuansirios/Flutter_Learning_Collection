/**
 * 首页列表
 */
import 'package:flutter/material.dart';
import '../BaseWidgets/BaseWidgets.dart';
import '../LayoutWidgets/LayoutWidgets.dart';
import '../ContainerWidgets/ContainerWidgets.dart';
import '../ScrollAbleWidgets/ScrollAbleWidgets.dart';

class RootView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
      ),
      body: RootListView(),
    );
  }
}

class RootListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getListData(context),
    );
  }

  final List dataList = [
    {"title": "基础组件", "component": BaseWidgets()},
    {"title": "布局类组件", "component": LayoutWidgets()},
    {"title": "容器类组件", "component": ContainerWidgets()},
    {"title": "可滚动组件", "component": ScrollAbleWidgets()},
    {"title": "功能型组价", "component": ""},
    {"title": "事件处理与通知", "component": ""},
    {"title": "动画", "component": ""},
    {"title": "自定义组件", "component": ""},
    {"title": "文件操作与网络请求", "component": ""},
    {"title": "包与插件", "component": "learn10.Demo()"},
    {"title": "国际化", "component": ""},
    {"title": "核心原理", "component": ""}
  ];

  List<Widget> _getListData(BuildContext context) {
    List<Widget> list = List();
    for (int i = 0; i < dataList.length; i++) {
      var title = dataList[i]["title"];

      list.add(Column(
        children: <Widget>[
          if (title == "基础组件")
            Column(children: <Widget>[
              Text(
                "--- 入门篇 ---",
                style: TextStyle(height: 3),
              ),
              Divider()
            ]),
            if (title == "事件处理与通知")
            Column(children: <Widget>[
              Text(
                "--- 进阶篇 ---",
                style: TextStyle(height: 3),
              ),
              Divider()
            ]),
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
