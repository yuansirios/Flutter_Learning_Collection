import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var _username = TextEditingController(); //初始化的时候给表单赋值
  var _password;

  @override
  void initState() {
    super.initState();
    _username.text = '初始值';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('表单演示页面'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          // child:TextDemo() ,
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: "请输入用户名"),
                controller: _username,
                onChanged: (value) {
                  setState(() {
                    _username.text = value;
                  });
                },
              ),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "密码"),
                onChanged: (value) {
                  setState(() {
                    this._password = value;
                  });
                },
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 40,
                child: RaisedButton(
                  child: Text("登录"),
                  onPressed: () {
                    print(this._username.text);
                    print(this._password);
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}

class Demo1 extends StatelessWidget {
  const Demo1({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TextField'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    hintText: "请输入搜索的内容", border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "多行文本框", border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "密码框", border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "用户名")),
              SizedBox(height: 20),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "密码",
                    // labelStyle: TextStyle()
                  )),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.people), hintText: "请输入用户名")),

            ],
          ),
        ));
  }
}
