import 'package:flutter/material.dart';
import 'PageDetail.dart';

class PageThree extends StatefulWidget {
  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  var arguments;
  _PageThreeState({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text("结果：${this.arguments == null ? '' : this.arguments}"),
          RaisedButton(
            child: Text('点击跳转传参'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              //跳转传参
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => PageDetail(arguments: {"id":"跳转传参"})))
                  .then((_) {
                setState(() {
                  this.arguments = _;
                });
              });
            },
          ),

          RaisedButton(
            child: Text('路由管理跳转传参'),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, '/detail',arguments: {
                "id":"路由管理跳转传参"
              }).then((_){
                setState(() {
                  this.arguments = _;
                });
              });  
            },
          )
        ],
      ),
    );
  }
}
