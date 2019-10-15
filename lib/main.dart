import 'package:flutter/material.dart';

import 'day01/learn01.dart' as learn01;
import 'day01/learn02.dart' as learn02;
import 'day01/learn03.dart' as learn03;
import 'day01/learn04.dart' as learn04;
import 'day02/learn05.dart' as learn05;
import 'day02/learn06.dart' as learn06;
import 'day02/learn07.dart' as learn07;
import 'day02/learn08.dart' as learn08;
import 'day02/learn09.dart' as learn09;
import 'day02/learn10.dart' as learn10;
import 'day02/learn11.dart' as learn11;
import 'day03/learn12.dart' as learn12;
import 'day03/learn13.dart' as learn13;
import 'day04/learn14.dart' as learn14;
import 'day04/learn15.dart' as learn15;
import 'day04/learn16.dart' as learn16;
import 'day05/Button.dart'    as learn17;
import 'day05/CheckBox.dart'  as learn18;
import 'day05/Radio.dart'     as learn19;
import 'day05/TextField.dart' as learn20;
import 'day05/FormDemo.dart'  as learn21;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Content());
  }
}

class Content extends StatelessWidget {
  final List dataList = [
    {"title": "Scaffold组件", "component": learn01.Demo()},
    {"title": "Container组件、Text组件详解", "component": learn02.Demo()},
    {"title": "Image图片组件", "component": learn03.Demo()},
    {"title": "ListView基础列表组件", "component": learn04.Demo()},
    {"title": "List动态列表", "component": learn05.Demo()},
    {"title": "GridView组件", "component": learn06.Demo()},
    {"title": "Paddiing、Row、Column、Expanded组件", "component": learn07.Demo()},
    {"title": "Stack层叠组件", "component": learn08.Demo()},
    {"title": "AspectRatio、Card卡片组件", "component": learn09.Demo()},
    {"title": "Wrap组件", "component": learn10.Demo()},
    {"title": "StatefulWidget状态组件", "component": learn11.Demo()},
    {"title": "BottomNavigationBar 自定义底部导航条、以及实现页面切换","component": learn12.Demo()},
    {"title": "普通路由、普通路由传值、命名路由、命名路由传值", "component": learn13.Demo()},
    {"title": "替换路由pushReplacementNamed", "component": learn14.Demo()},
    {"title": "AppBar 自定义顶部导航按钮 图标、颜色 以及 TabBar 定义顶部 Tab 切换", "component": learn15.Demo()},
    {"title": "Drawer侧边栏、以及侧边栏内容布局", "component": learn16.Demo()},
    {"title": "按钮组件 RaisedButton、FlatButton、OutlineButton、IconButton、ButtonBar以及自定义按钮组件", "component": learn17.Demo()},
    {"title": "CheckBox多选框组件", "component": learn18.Demo()},
    {"title": "Radio和Switch单选框组件", "component": learn19.Demo()},
    {"title": "TextField文本框组件", "component": learn20.Demo()},
    {"title": "表单示例", "component": learn21.Demo()},
  ];

  List<Widget> _getListData(BuildContext context) {
    List<Widget> list = List();
    for (int i = 0; i < dataList.length; i++) {
      list.add(Column(
        children: <Widget>[
          ListTile(
            title: Text("【$i】${dataList[i]["title"]}"),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => dataList[i]["component"]));
            },
          ),
          Divider(height: 1)
        ],
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter学习记录'),
      ),
      body: ListView(
        children: _getListData(context),
      ),
    );
  }
}
