/**
 * 目录结构介绍、
 * 入口、
 * 自定义Widget、
 * Center组件、Text组件、
 * MaterialApp组件、
 * Scaffold组件
 */

import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold组件'),
      ),
      body: Center(
        child: Text(
          "我是一个文本内容",
          textDirection: TextDirection.ltr,
          style: TextStyle(fontSize: 20.0, color: Colors.blue),
        ),
      ),
    );
  }
}
