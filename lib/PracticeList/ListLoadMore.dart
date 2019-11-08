import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../Components/YSToast.dart';
import '../Components/Dialog/LoadingDialog.dart';

class ListLoadMore extends StatefulWidget {
  @override
  _ListLoadMoreState createState() => _ListLoadMoreState();
}

class _ListLoadMoreState extends State<ListLoadMore> {
  bool isNoData = false;
  
  List<String> items = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    LoadingDialog.showLoading("正在加载数据正在加载数据正在加载数据");
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();

    items = ["1", "2", "3", "4", "5", "6", "7", "8"];

    LoadingDialog.dismiss();

    checkSource();
  }

  void checkSource() {
    setState(() {
      if (items.length == 0) {
        isNoData = true;
      } else {
        isNoData = false;
      }
    });
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});

    if (items.length == 10) {
      YSToast.showInfo("加载错误，请重试！");
      _refreshController.loadFailed();
    } else if (items.length == 12) {
      _refreshController.loadNoData();
    } else {
      _refreshController.loadComplete();
    }

    checkSource();
  }

  @override
  void initState() {
    super.initState();
    checkSource();
  }

  @override
  Widget build(BuildContext context) {
    
    LoadingDialog.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('下拉加载示例'),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: !isNoData,
        header: ClassicHeader(
            idleText: "下拉刷新",
            releaseText: "放开刷新",
            refreshingText: "努力加载中",
            completeText: "加载完成"),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败，点击重试");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松开加载更多");
            } else {
              body = Text("没有更多数据");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: isNoData
            ? Center(
                child: Text("没有数据，下拉试试"),
              )
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Center(
                      child: Text(items[index]),
                    ),
                  );
                },
                itemExtent: 100.0,
                itemCount: items.length,
              ),
      ),
    );
  }
}
