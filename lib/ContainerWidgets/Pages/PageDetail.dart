import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  final Map arguments;
  PageDetail({Key key, this.arguments}) : super(key: key);

  @override
  _PageDetailState createState() => _PageDetailState(arguments: arguments);
}

class _PageDetailState extends State<PageDetail>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final arguments;
  _PageDetailState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("详情"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text("结果：${this.arguments == null ? '' : this.arguments}"),
              RaisedButton(
                child: Text('返回参数'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  //返回传参
                  Navigator.pop(context, "detail给的参数");
                },
              ),
              RaisedButton(
                child: Text('路由管理返回参数'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop({"id": "路由管理返回参数"});
                },
              ),
              RaisedButton(
                child: Text('路由替换'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/detail2',
                      arguments: {"id": "路由替换"});
                },
              )
            ],
          ),
        ));
  }
}
