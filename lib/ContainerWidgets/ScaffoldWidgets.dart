/**
 * Scaffold、TabBar、底部导航
 */
import 'package:flutter/material.dart';
import 'Pages/PageOne.dart';
import 'Pages/PageTwo.dart';
import 'Pages/PageThree.dart';
import 'pages/PageDetail.dart';

class ScaffoldWidgets extends StatefulWidget {
  @override
  _ScaffoldWidgetsState createState() => _ScaffoldWidgetsState();
}

class _ScaffoldWidgetsState extends State<ScaffoldWidgets> {
  int _currentIndex = 0;
  List _pageList = [
    PageOne(),
    PageTwo(),
    PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold、TabBar、底部导航'),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(icon: Icon(Icons.share), onPressed: _share),
        ],
      ),
      drawer: MyDrawer(),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: _tabBar()
    );
  }

//底部分栏
  Widget _tabBar(){
    return  BottomNavigationBar(
        currentIndex: this._currentIndex, //配置对应的索引值选中
        onTap: (int index) {
          setState(() {
            //改变状态
            this._currentIndex = index;
          });
        },
        iconSize: 30.0, //icon的大小
        fixedColor: Colors.green, //选中的颜色
        type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("第一页")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("第二页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("第三页"))
        ],
      );
  }

  _share() {
    Navigator.pop(context);
    print("分享");
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/a.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                    onTap: (){
                      //关闭侧边栏
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                    onTap: (){
                      Navigator.of(context).pop();
                      //跳转
              Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => PageDetail()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}