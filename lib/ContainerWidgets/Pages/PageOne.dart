import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with SingleTickerProviderStateMixin {
  final List<String> _tabs = ["热门", "推荐","其他"];
  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    //注意，监听有点问题，要处理下
    _tabController = TabController(length: _tabs.length, vsync: this);
    _tabController.addListener(() {
      int index = _tabController.index;
      if (index != _currentIndex){
        _currentIndex = index;
      }else{
        return;
      }
      print("发生了变化，当前是 ${_tabs[_currentIndex]}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: Material(
          color: Colors.blue[100],
          child: TabBar(
            labelColor: Colors.green,
            indicatorColor: Colors.green,
            controller: _tabController,
            tabs: _tabs
                .map((item) => Tab(
                      text: item,
                    ))
                .toList(),
            indicatorSize: TabBarIndicatorSize.label,
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text("热门")),
          Center(child: Text("推荐")),
          Center(child: Text("其他")),
        ],
      ),
    );
  }
}
