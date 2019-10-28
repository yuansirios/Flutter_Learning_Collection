/**
 * 基础组件
 */
import 'package:flutter/material.dart';
import 'StateManager.dart';
import 'TextAndFonts.dart';
import 'Button.dart';
import 'ImageAndIcon.dart';
import 'SwitchAndCheckBox.dart';
import 'FormTestRoute.dart';
import 'TextField.dart';
import 'LinearProgress.dart';

class BaseWidgets extends StatelessWidget {
  final String title;
  BaseWidgets({this.title = "基础组件"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
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
    {"title": "状态管理", "component": StateManager()},
    {"title": "文本、字体样式", "component": TextAndFonts()},
    {"title": "按钮", "component": Button()},
    {"title": "图片和Icon", "component": ImageAndIcon()},
    {"title": "单选框和复选框", "component": SwitchAndCheckBox()},
    {"title": "输入框", "component": TextFieldDemo()},
    {"title": "表单", "component": FormTestRoute()},
    {"title": "进度指示器", "component": LinearProgress()}
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
