/**
 * 页面布局 - AspectRatio、Card卡片组件
 */
import 'package:flutter/material.dart';
import 'res/listData.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AspectRatio、Card卡片组件'),
      ),
      body: Content()
    );
  }
}

//AspectRatio
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: AspectRatio(
          /**
           * 宽高比，最终可能不会根据这个值去布局，
           * 具体则要看综合因素，外层是否允许按照这种比例进行布局，
           * 这只是一个参考值
           */
          aspectRatio: 2.0 / 1.0,
          child: Container(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

//Card 是卡片组件块，内容可以由大多数类型的 Widget 构成，Card 具有圆角和阴影，这让它 看起来有立体感。
class Content1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          //外边距
          margin: EdgeInsets.all(10),
          //Card 的阴影效果，默认的阴影效果为圆角的 长方形边。
          shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(style: BorderStyle.none)),
          //子组件
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text("张三", style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师")),
              Divider(),
              ListTile(
                title: Text("电话：123123123123"),
              ),
              ListTile(
                title: Text("地址：***********"),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text("张三", style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师")),
              Divider(),
              ListTile(
                title: Text("电话：123123123123"),
              ),
              ListTile(
                title: Text("地址：***********"),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              ListTile(
                  title: Text("张三", style: TextStyle(fontSize: 28)),
                  subtitle: Text("高级软件工程师")),
              Divider(),
              ListTile(
                title: Text("电话：123123123123"),
              ),
              ListTile(
                title: Text("地址：***********"),
              ),
            ],
          ),
        )
      ],
    );
  }
}

//Card组件实现一个图文列表布局
class Content2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(value["imageUrl"], fit: BoxFit.cover),
              ),
              ListTile(
                title: Text(value["title"]),
                subtitle: Text("我是很长很长的描述我是很长很长的描述我是很长很长的描述我是很长很长的描述我是很长很长的描述",
                    overflow: TextOverflow.ellipsis),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(value["imageUrl"]),
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
