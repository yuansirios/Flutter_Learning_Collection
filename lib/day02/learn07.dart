//页面布局 Paddiing Row Column Expanded组件详解

import 'package:flutter/material.dart';

class Learn07 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Demo5();
  }
}

//Padding组件
class Demo1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding值，EdgeInserts设置填充的值
      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      //子组件
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.asset("images/a.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.asset("images/a.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.asset("images/a.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.asset("images/a.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.asset("images/a.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.asset("images/a.png", fit: BoxFit.cover),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Image.asset("images/a.png", fit: BoxFit.cover),
          )
        ],
      ),
    );
  }
}

//Row水平布局组件
class Demo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: 500,
      color: Colors.black26,
      child: Row(
        //次轴的排序方式
        crossAxisAlignment: CrossAxisAlignment.center,
        //主轴的排序方式
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //组件子元素
        children: <Widget>[
          IconContainer(Icons.home, color: Colors.red),
          IconContainer(Icons.search, color: Colors.blue),
          IconContainer(Icons.send, color: Colors.orange),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  double size;
  IconData icon;
  Color color;

  IconContainer(this.icon, {this.size, this.color = Colors.blue}) {
    this.size = 32.0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size + 60,
      height: this.size + 60,
      color: this.color,
      child: Center(
        child: Icon(this.icon, color: Colors.white, size: this.size),
      ),
    );
  }
}

//Column垂直布局组件
class Demo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        width: 500,
        color: Colors.black26,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconContainer(Icons.home, color: Colors.red),
            IconContainer(Icons.search, color: Colors.blue),
            IconContainer(Icons.send, color: Colors.orange),
          ],
        ));
  }
}

//Expanded类似Web中的Flex布局
class Demo4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: IconContainer(Icons.home),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: IconContainer(Icons.search),
          ),
        ],
      ),
    );
  }
}

//实践
class Demo5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.black,
            height: 200,
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.asset(
                  "images/a.png",
                  fit: BoxFit.cover,
                  height: 150,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                  flex: 1,
                  child: Container(
                      height: 150,
                      // color: Colors.orange,
                      child: ListView(
                        children: <Widget>[
                          Container(
                            child: Image.asset("images/a.png",fit: BoxFit.cover),
                            height: 70,
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Image.asset("images/a.png",fit: BoxFit.cover),
                            height: 70,
                          ),
                        ],
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
