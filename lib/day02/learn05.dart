//List动态列表(动态循环数据)
import 'package:flutter/material.dart';
import 'res/listData.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List动态列表(动态循环数据)'),
      ),
      body: Content()
    );
  }
}

//循环创建列表
class Content extends StatelessWidget {
  List list = List();
  //效果一样
  // Content({Key key}) : super(key: key) {
  Content() {
    for (var i = 0; i < 20; i++) {
      list.add("这是第${i}条数据");
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.phone),
          title: Text("${list[index]}"),
        );
      },
    );
  }
}

//通过数据源创建列表
class Content2 extends StatelessWidget {
  Widget _getListData(content, index) {
    return ListTile(
        title: Text(listData[index]["title"]),
        leading: Image.network(listData[index]["imageUrl"]),
        subtitle: Text(listData[index]["author"]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: this._getListData,
    );
  }
}

//静态列表
class Content3 extends StatelessWidget {
  List<Widget> _getData() {
    return [
      ListTile(
        title: Text("我是一个列表"),
      ),
      ListTile(
        title: Text("我是一个列表"),
      ),
      ListTile(
        title: Text("我是一个列表"),
      ),
      ListTile(
        title: Text("我是一个列表"),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }
}

//循环创建2
class Content4 extends StatelessWidget {
  List<Widget> _getData() {
    List<Widget> list = List();
    for (int i = 0; i < 30; i++) {
      list.add(ListTile(
        title: Text("第${i}行"),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }
}

//循环创建3
class Content5 extends StatelessWidget {
  List<Widget> _getData() {
    var tempList = listData.map((value) {
      return ListTile(
          title: Text(value["title"]),
          leading: Image.network(value["imageUrl"]),
          subtitle: Text(value["author"]));
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: this._getData(),
    );
  }
}
