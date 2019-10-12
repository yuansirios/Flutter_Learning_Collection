import 'package:flutter/material.dart';

// import '../Form.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (RaisedButton(
        child: Text("跳转到表单页面"),
        onPressed: () {
          //普通路由传值
          // Navigator.of(context).push(MaterialPageRoute(
              // builder: (context) => FormPage(title: '我是跳转传值')));
          //命名路由传值
          Navigator.pushNamed(context, '/from',arguments:{
            "id":20
          });
        },
      )),
    );
  }
}
