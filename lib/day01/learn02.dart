/**
 * Container组件、Text组件详解
 */
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container组件、Text组件详解'),
      ),
      body: Center(
          child: Container(
        child: Text(
          '我是Day02我是Day02我是Day02我是Day02我是Day02我是Day02',
          textAlign: TextAlign.left,
          // overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textScaleFactor: 1.5,
          style: TextStyle(
              fontSize: 20.0,
              color: Colors.red,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              //线条
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.blue,
              decorationStyle: TextDecorationStyle.dashed,
              //字间距
              letterSpacing: 5.0),
        ),
        width: 300.0,
        height: 300.0,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(color: Colors.blue, width: 2.0),
            //圆角特定用法
            borderRadius: BorderRadius.all(Radius.circular(30))),
        //外边距
        // margin: EdgeInsets.all(10),
        //内边距
        // padding: EdgeInsets.all(20),
        //旋转
        // transform: Matrix4.rotationZ(-0.3)
        //内部元素对齐
        alignment: Alignment.centerLeft,
      )),
    );
  }
}
