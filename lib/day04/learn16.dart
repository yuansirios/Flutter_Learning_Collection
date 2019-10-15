
/*
 * Drawer侧边栏、以及侧边栏内容布局
 */

import 'package:flutter/material.dart';
import 'pages/Search.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Content();
  }
}

//DrawerHeader
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer 侧边栏"),
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"),
                    fit: BoxFit.cover)),
            child: ListView(
              children: <Widget>[Text("我是一个头部")],
            ),
          ),
          ListTile(
            title: Text("个人中心"),
            leading: CircleAvatar(
              child: Icon(Icons.people),
            ),
          ),
          Divider(),
          ListTile(
            title: Text("系统设置"),
            leading: CircleAvatar(
              child: Icon(Icons.settings),
            ),
          ),
        ],
      )),
      endDrawer: Drawer(
        child: Text("右侧侧边栏"),
      ),
    );
  }
}

//UserAccountsDrawerHeader
class Content1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UserAccountsDrawerHeader"),
      ),
      drawer: Drawer(
          child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("yuan"),
            accountEmail: Text("yuan@163.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://www.itying.com/images/flutter/2.png"),
            ),
            decoration: BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.itying.com/images/flutter/2.png"),
                    fit: BoxFit.cover)),
            otherAccountsPictures: <Widget>[
              Image.asset("images/a.png"),
              Image.asset("images/a.png"),
              Image.asset("images/a.png"),
            ],
          ),
          ListTile(
            title: Text("个人中心"),
            leading: CircleAvatar(
              child: Icon(Icons.people),
            ),
            onTap: (){
              //关闭侧边栏
              Navigator.of(context).pop();
              //跳转
              Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SearchPage()));
            },
          ),
          Divider(),
          ListTile(
            title: Text("系统设置"),
            leading: CircleAvatar(
              child: Icon(Icons.settings),
            ),
          ),
        ],
      )),
      endDrawer: Drawer(
        child: Text("右侧侧边栏"),
      ),
    );
  }
}
