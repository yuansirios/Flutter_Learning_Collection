/**
 * 页面布局 - Wrap组件
 */

import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap组件'),
      ),
      body: Content()
    );
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.pink,
      padding: EdgeInsets.all(20),
      child: Wrap(
        //主轴方向的间距
        spacing: 20,
        //run的间距，可理解为新的一行
        runSpacing: 10,
        alignment: WrapAlignment.start,

        children: <Widget>[
          MyButton("第1节"),
          MyButton("第22节"),
          MyButton("第33节"),
          MyButton("第444节"),
          MyButton("第5555节"),
          MyButton("第66666节"),
          MyButton("第777777节"),
          MyButton("第8888888节"),
          MyButton("第99999999节"),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;

  const MyButton(this.text, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(this.text),
        textColor: Theme.of(context).accentColor,
        onPressed: () {});
  }
}
