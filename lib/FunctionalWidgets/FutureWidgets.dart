import 'package:flutter/material.dart';

class FutureWidgets extends StatefulWidget {
  @override
  _FutureWidgetsState createState() => _FutureWidgetsState();
}

class _FutureWidgetsState extends State<FutureWidgets> {
  Future<String> mockNetworkData() async {
    return Future.delayed(Duration(seconds: 2), () => "我是从互联网上获取的数据");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('异步UI更新'),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: mockNetworkData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // 请求已结束
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  // 请求失败，显示错误
                  return Text("Error: ${snapshot.error}");
                } else {
                  // 请求成功，显示数据
                  return Text("Contents: ${snapshot.data}");
                }
              } else {
                // 请求未结束，显示loading
                return CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
