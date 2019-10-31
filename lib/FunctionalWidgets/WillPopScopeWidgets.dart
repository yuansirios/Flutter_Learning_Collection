import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WillPopScopeWidgets extends StatefulWidget {
  @override
  _WillPopScopeWidgetsState createState() => _WillPopScopeWidgetsState();
}

class _WillPopScopeWidgetsState extends State<WillPopScopeWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('导航返回拦截（WillPopScope）'),
      ),
      body: WebView(
      initialUrl: "https://book.flutterchina.club/chapter7/willpopscope.html",
      //JS执行模式 是否允许JS执行
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {},
      onPageFinished: (url) {},
    ),
    );
  }
}
