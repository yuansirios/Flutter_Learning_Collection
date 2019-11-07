import 'package:flutter/material.dart';

class CustomScrollViewWidgets extends StatefulWidget {
  @override
  _ListViewWidgetsState createState() => _ListViewWidgetsState();
}

class _ListViewWidgetsState extends State<CustomScrollViewWidgets> {
  ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮
  String _progress = "0%"; //保存进度百分比

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print(_controller.offset); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomScrollView'),
      ),
      body: Scrollbar(
          child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
          });
          print("BottomEdge: ${notification.metrics.extentAfter == 0}");
          //return true; //放开此行注释后，进度条将失效
          return false;
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CustomScrollView(
              slivers: <Widget>[_content, _content1],
              controller: _controller,
            ),
            CircleAvatar(
              //显示进度百分比
              radius: 30.0,
              child: Text(_progress),
              backgroundColor: Colors.black54,
            )
          ],
        ),
      )),
      floatingActionButton: !showToTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              }),
    );
  }

//ListView
  Widget _content = SliverPadding(
    padding: EdgeInsets.all(18),
    sliver: SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        //创建列表项
        return Container(
          alignment: Alignment.center,
          color: Colors.lightBlue[100 * (index % 9)],
          child: Text('SliverFixedExtentList $index'),
        );
      }, childCount: 50 //50个列表项
          ),
    ),
  );

//ListView.builder
  Widget _content1 = SliverPadding(
    padding: EdgeInsets.all(8),
    sliver: SliverFixedExtentList(
      itemExtent: 50.0,
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        //创建列表项
        return Container(
          alignment: Alignment.center,
          color: Colors.lightBlue[100 * (index % 9)],
          child: Text('list item $index'),
        );
      }, childCount: 50 //50个列表项
          ),
    ),
  );
}
