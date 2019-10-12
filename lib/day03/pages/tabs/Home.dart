import 'package:flutter/material.dart';

// import '../Search.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text("跳转到搜索页面"),
          onPressed: () {
            //普通路由
            // Navigator.of(context)
            // .push(MaterialPageRoute(builder: (context) => SearchPage()));
            //命名路由和传值
            // Navigator.pushNamed(context, '/search');
            Navigator.pushNamed(context, '/search', arguments: {"id": 20});
          },
          color: Theme.of(context).accentColor,
          textTheme: ButtonTextTheme.primary),
    );
  }
}
