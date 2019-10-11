//页面布局 Stack层叠组件 Stack与Align  Stack与Positioned实现定位布局

import 'package:flutter/material.dart';

class Learn08 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Demo2();
  }
}

//Stack 整体位置
class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // alignment: Alignment.bottomRight,
        alignment: Alignment(1, -1),
        children: <Widget>[
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text(
            "我是一个文本",
            style: TextStyle(fontSize: 40, color: Colors.green),
          )
        ],
      ),
    );
  }
}

//Stack Align 子元素位置
class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          // alignment: Alignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment(1, -0.2),
              child: Icon(Icons.home, size: 40, color: Colors.white),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.search, size: 30, color: Colors.white),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.settings_applications,
                  size: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

//Stack Positioned top|bottom|left|right 各位置设置
class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Container(
            height: 400,
            width: 300,
            color: Colors.red,
            child: Stack(
              // alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                //  left: 10,
                  child: Icon(Icons.home,size: 40,color: Colors.white),
                ),
                Positioned(
                 bottom: 0,
                 left: 100,
                  child: Icon(Icons.search,size: 30,color: Colors.white),
                ),
                Positioned(
                  right: 0,
                  child: Icon(Icons.settings_applications,size: 30,color: Colors.white),
                )
              ],
            ),
      ),
    );
  }
}