import 'package:flutter/material.dart';

class ListViewWidgets extends StatefulWidget {
  @override
  _ListViewWidgetsState createState() => _ListViewWidgetsState();
}

class _ListViewWidgetsState extends State<ListViewWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[_content, _content1, _content2],
          ),
        ));
  }

//ListView
  final Widget _content = Container(
    child: ListView(
      children: <Widget>[
        const Text('第一行'),
        const Text('第二行'),
        const Text('第三行'),
        const Text('第四行'),
      ],
    ),
    height: 200,
    color: Colors.yellow,
  );

//ListView.builder
  final Widget _content1 = Container(
    height: 200,
    color: Colors.pink,
    child: ListView.builder(
        itemCount: 100,
        itemExtent: 50.0, //强制高度为50.0
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("$index"));
        }),
  );

//ListView.separated
  static Widget divider1 = Divider(color: Colors.blue);
  static Widget divider2 = Divider(color: Colors.green);

  final Widget _content2 = Container(
    child: ListView.separated(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(title: Text("$index"));
      },
      //分割器构造器
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? divider1 : divider2;
      },
    ),
    height: 200,
    color: Colors.cyan[100],
  );
}
