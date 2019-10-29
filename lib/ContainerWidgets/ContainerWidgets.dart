/**
 * 容器类组件
 */
import 'package:flutter/material.dart';
import 'PaddingWidgets.dart';
import 'SizeLimiteWidgets.dart';
import 'DecoratedBoxWidgets.dart';
import 'TransformWidgets.dart';
import 'ClipWidgets.dart';
import 'ScaffoldWidgets.dart';

class ContainerWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("容器类组件"),
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
    {"title": "填充（Padding）", "component": PaddingWidgets()},
    {"title": "尺寸限制类容器", "component": SizeLimiteWidgets()},
    {"title": "装饰容器DecoratedBox", "component": DecoratedBoxWidgets()},
    {"title": "变换（Transform）", "component": TransformWidgets()},
    {"title": "Container容器", "component": ContainerTestWidgets()},
    {"title": "Scaffold、TabBar、底部导航", "component": ScaffoldWidgets()},
    {"title": "剪裁（Clip）", "component": ClipWidgets()}
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

/* Container组件 */
class ContainerTestWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container组件'),
      ),
      body: _content(),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _test1(),
                  Container(
                    margin: EdgeInsets.all(20.0), //容器外补白
                    color: Colors.orange,
                    child: Text("Hello world!"),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0), //容器内补白
                    color: Colors.orange,
                    child: Text("Hello world!"),
                  ),
                  Text("Container内margin和padding都是通过Padding 组件来实现的"),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(color: Colors.orange),
                      child: Text("Hello world!"),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text("Hello world!"),
                    ),
                  ),
                ])));
  }

  Widget _test1() {
    return Container(
      margin: EdgeInsets.only(
          top: 50.0, left: 120.0, bottom: 100, right: 50), //容器外填充
      constraints: BoxConstraints.tightFor(width: 200.0, height: 150.0), //卡片大小
      decoration: BoxDecoration(
          //背景装饰
          gradient: RadialGradient(
              //背景径向渐变
              colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: .98),
          boxShadow: [
            //卡片阴影
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2.0, 2.0),
                blurRadius: 4.0)
          ]),
      transform: Matrix4.rotationZ(.2), //卡片倾斜变换
      alignment: Alignment.center, //卡片内文字居中
      child: Text(
        //卡片文字
        "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
      ),
    );
  }
}
