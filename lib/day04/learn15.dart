/**
 * AppBar 自定义顶部导航按钮 图标、颜色 以及 TabBar 定义顶部 Tab 切换
 */

import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBardemoPage();
  }
}

/*
* leading         在标题前面显示的一个控件，在首页通常显示应用的logo;在其他界面通常显示为返回按钮
* title           标题，通常显示为当前界面的标题文字，可以放组件
* actions         通常使用 IconButton 来表示，可以放按钮组
* bottom          通常放 tabBar，标题下面显示一个 Tab 导航栏
* backgroundColor 导航背景颜色
* iconTheme       图标样式
* textTheme       文字样式
* centerTitle     标题是否居中显示
 */
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Search",
            onPressed: () {
              print('menu Pressed');
            }),
        title: Text('AppBar 自定义'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {
                print('Search Pressed');
              }),
          IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: "more_horiz",
              onPressed: () {
                print('more_horiz Pressed');
              })
        ],
      ),
      body: Text('这是 Appbar'),
    );
  }
}

//AppBar 中自定义 TabBar 实 现顶部 Tab 切换
/*
 * tabs                 显示的标签内容，一般使用 Tab 对象,也可以是其他 的 Widget
 * controller           TabController 对象
 * isScrollable         是否可滚动
 * indicatorColor       指示器颜色
 * indicatorWeight      指示器高度
 * indicatorPadding     底部指示器的 Padding
 * indicator            指示器 decoration，例如边框等
 * indicatorSize        指示器大小计算方式，TabBarIndicatorSize.label 跟文 字等宽,TabBarIndicatorSize.tab 跟每个 tab 等宽
 * labelColor 选中      label 颜色
 * labelStyle 选中      label 的 Style
 * labelPadding         每个 label 的 padding 值
 * unselectedLabelColor 未选中 label 颜色
 * unselectedLabelStyle 未选中 label 的 Style
 */
class Content1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("AppBar 中自定义 TabBar"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[Tab(text: "热门"), Tab(text: "推荐")],
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(title: Text("第一个tab")),
                ListTile(title: Text("第一个tab")),
                ListTile(title: Text("第一个tab"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

//把TabBar放在导航最顶部
class Content2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            //长按提示文字
            tooltip: "Search",
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: TabBar(
                  tabs: <Widget>[Tab(text: "热门"), Tab(text: "推荐")],
                  indicatorSize: TabBarIndicatorSize.label,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView(
              children: <Widget>[
                ListTile(title: Text("第一个tab")),
                ListTile(title: Text("第一个tab")),
                ListTile(title: Text("第一个tab"))
              ],
            ),
            ListView(
              children: <Widget>[
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab")),
                ListTile(title: Text("第二个tab"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

//AppBar 中自定义 TabBar 实 现 Tabs 的另一种方法
class AppBardemoPage extends StatefulWidget {
  AppBardemoPage({Key key}) : super(key: key);
  _AppBardemoPageState createState() => _AppBardemoPageState();
}

class _AppBardemoPageState extends State<AppBardemoPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("顶部tab切换"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.directions_bike),
            ),
            Tab(
              icon: Icon(Icons.directions_boat),
            ),
            Tab(
              icon: Icon(Icons.directions_bus),
            )
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text('自行车')),
          Center(child: Text('船')),
          Center(child: Text('巴士')),
        ],
      ),
    );
  }
}
