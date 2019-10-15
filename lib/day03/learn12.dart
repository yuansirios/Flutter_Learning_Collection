
/**
 * BottomNavigationBar 自定义底部导航条、以及实现页面切换
 */

import 'package:flutter/material.dart';

import 'pages/Tabs.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue), home: Tabs());
  }
}
