/**
 * ListView基础列表组件、水平列表组件、图标组件
 */
import 'package:flutter/material.dart';

class Learn04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Content2();
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.phone,
            size: 30,
          ),
          title: Text(
            "this is list",
            style: TextStyle(fontSize: 28.0),
          ),
          subtitle: Text('this is list this is list'),
        ),
        ListTile(
          title: Text(
            "this is list",
            style: TextStyle(fontSize: 28.0),
          ),
          subtitle: Text('this is list this is list'),
          leading: Icon(Icons.phone),
        ),
        ListTile(
          title: Text(
            "this is list",
            style: TextStyle(fontSize: 28.0),
          ),
          subtitle: Text('this is list this is list'),
        ),
        ListTile(
          title: Text(
            "this is list",
            style: TextStyle(fontSize: 28.0),
          ),
          subtitle: Text('this is list this is list'),
        ),
        ListTile(
          title: Text(
            "this is list",
            style: TextStyle(fontSize: 28.0),
          ),
          subtitle: Text('this is list this is list'),
        ),
      ],
    ));
  }
}

class Content2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        margin: EdgeInsets.all(10),
        child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
          Container(
            width: 180,
            color: Colors.lightBlue,
          ),
          Container(
            width: 180,
            color: Colors.amber,
            child: ListView(
              children: <Widget>[
                Image.asset('images/a.png'),
                SizedBox(height: 30),
                Text('这是一个文本信息',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16))
              ],
            ),
          ),
          Container(
            width: 180,
            color: Colors.deepOrange,
          ),
          Container(
            width: 180,
            color: Colors.deepPurpleAccent,
          ),
        ]));
  }
}
