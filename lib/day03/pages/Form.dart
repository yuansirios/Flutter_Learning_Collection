import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {

  final Map arguments;
  // FormPage({this.title="表单"});
  FormPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('返回'),
        onPressed: (){
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        title: Text("传值"),
      ),
      body: ListView(
        children: <Widget>[

          ListTile(
            title: Text('我是表单页面${arguments != null ? arguments['id']:'0'}'),
          ),
             ListTile(
            title: Text('我是表单页面'),
          ),
             ListTile(
            title: Text('我是表单页面'),
          ),
             ListTile(
            title: Text('我是表单页面'),
          )
        ],
      ),
    );
  }
}