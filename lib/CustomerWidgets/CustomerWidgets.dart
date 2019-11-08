import 'package:flutter/material.dart';
import 'GradientButtonWidgets.dart';
import 'TurnBoxWidgets.dart';
import 'CustomPaintRoute.dart';
import 'CustomerDialogWidgets.dart';

class CustomerWidgets extends StatefulWidget {
  @override
  _CustomerWidgetsState createState() => _CustomerWidgetsState();
}

class _CustomerWidgetsState extends State<CustomerWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义组件'),
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
    {"title": "组合现有组件", "component": GradientButtonWidgets()},
    {"title": "组合实例：TurnBox", "component": TurnBoxRoute()},
    {"title": "自绘组件 （CustomPaint与Canvas）", "component": CustomPaintRoute()},
    {"title": "自定义弹框", "component": CustomerDialogWidgets()}
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