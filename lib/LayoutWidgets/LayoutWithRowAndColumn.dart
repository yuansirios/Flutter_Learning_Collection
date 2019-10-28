/**
 *  线性布局（Row和Column）
 */
import 'package:flutter/material.dart';

class LayoutWithRowAndColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('线性布局（Row和Column）'),
      ),
      body: _column(),
    );
  }

  Widget _column() {
    return Column(
      //测试Row对齐方式，排除Column默认居中对齐的干扰
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: <Widget>[
            Text(" hello world "),
            Text(" I am Jack "),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            Text(
              " hello world ",
              style: TextStyle(fontSize: 30.0),
            ),
            Text(" I am Jack "),
          ],
        ),
        Container(
            color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("hi"),
                Text("world"),
              ],
            )),
        Text("屏幕宽度占有……"),
        Container(
            color: Colors.green,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("hi"),
                  Text("world"),
                ],
              ),
            )),
        Text("铺满剩余空间……"),
        Expanded(
          child: Container(
              color: Colors.yellow,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: double.infinity),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
