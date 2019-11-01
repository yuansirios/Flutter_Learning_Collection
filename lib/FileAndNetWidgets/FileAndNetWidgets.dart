import 'package:flutter/material.dart';
import 'FileWidgets.dart';
import 'HttpWidgets.dart';
import 'DioWidgets.dart';
import 'JsonToModel.dart';
import 'DioCustomWidgets.dart';

class FileAndNetWidgets extends StatefulWidget {
  @override
  _FileAndNetWidgetsState createState() => _FileAndNetWidgetsState();
}

class _FileAndNetWidgetsState extends State<FileAndNetWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('文件和网络操作')),
      body: BaseListView()
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
    {"title": "文件操作", "component": FileWidgets()},
    {"title": "通过HttpClient发起HTTP请求", "component": HttpWidgets()},
    {"title": "Http请求-Dio http库", "component": DioWidgets()},
    {"title": "Dio网络库封装", "component": DioCustomWidgets()},
    {"title": "Json转Dart Model类", "component": JsonToModel()},
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