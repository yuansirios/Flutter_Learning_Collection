/**
 * 填充（Padding）
 */
import 'package:flutter/material.dart';

class PaddingWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('填充（Padding）'),
      ),
      body: _content(),
    );
  }

/*
EdgeInsets
我们看看EdgeInsets提供的便捷方法：

fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的填充。
all(double value) : 所有方向均使用相同数值的填充。
only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
symmetric({ vertical, horizontal })：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
 */
  Widget _content() {
    return Container(
        color: Colors.yellow,
        child: Padding(
          //上下左右各添加16像素补白
          padding: EdgeInsets.all(16.0),
          child: Column(
            //显式指定对齐方式为左对齐，排除对齐干扰
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: Colors.green,
                child: Padding(
                  //左边添加8像素补白
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text("左10"),
                ),
              ),
              Container(
                  color: Colors.red,
                  child: Padding(
                    //上下各添加8像素补白
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text("上下8"),
                  )),
              Container(
                  color: Colors.pink,
                  child: Padding(
                    // 分别指定四个方向的补白
                    padding: EdgeInsets.fromLTRB(40.0, 10, 40.0, 20.0),
                    child: Text("左40，上10，右40，下20"),
                  ))
            ],
          ),
        ));
  }
}
