/**
在 Flutter 中自定义组件其实就是一个类，这个类需要继承 StatelessWidget/StatefulWidget。
StatelessWidget是无状态组件，状态不可变的 widget
StatefulWidget是有状态组件，持有的状态可能在 widget 生命周期改变。
通俗的讲:如果我们想改变页面中的数据的话这个时候就需要用到 StatefulWidget
 */

import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget组件'),
      ),
      body: DemoState()
    );
  }
}

//自定义有状态组件
class DemoState extends StatefulWidget {
  DemoState({Key key}) : super(key: key);
  _DemoStatePage createState() => _DemoStatePage();
}

class _DemoStatePage extends State<DemoState> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Text("${this.count}"),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("点我"),
            onPressed: () {
              //只要触发setState,就会执行build方法
              setState(() {
                this.count++;
              });
            },
          )
        ],
      ),
    );
  }
}
