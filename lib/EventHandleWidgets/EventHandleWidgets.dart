import 'package:flutter/material.dart';
import 'GestureDetectorWidgets.dart';
import 'NotificationWidgets.dart';
import 'EventBusWidgets.dart';
import '../Components/EventBus.dart';

class EventHandleWidgets extends StatefulWidget {
  @override
  _EventHandleWidgetsState createState() => _EventHandleWidgetsState();
}

class _EventHandleWidgetsState extends State<EventHandleWidgets> {

  void initState(){
    super.initState();
    //测试总线监听
    bus.on("login", (arg) {
      print("EventHandleWidgets 收到了消息：$arg");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('事件处理与通知'),
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
    {"title": "手势识别", "component": GestureDetectorWidgets()},
    {"title": "Notification", "component": NotificationWidgets()},
    {"title": "全局事件总线", "component": EventBusWidgets()},
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
