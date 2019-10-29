import 'package:flutter/material.dart';
import '../ScaffoldWidgets.dart';

class PageDetail2 extends StatelessWidget {
  final Map arguments;
  PageDetail2({Key key, this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("详情2"),
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
                  Navigator.pop(context, "detail给的参数");
                },
              ),
              RaisedButton(
                child: Text('返回首页'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  //返回根
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => ScaffoldWidgets()),
                      (route) => route == null);
                },
              )
            ],
          ),
        ));
  }
}
