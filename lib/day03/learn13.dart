
/**
 * 普通路由、普通路由传值、命名路由、命名路由传值
 */
import 'package:flutter/material.dart';

import 'routes/Routes.dart';

//命名路由传值
class Learn13 extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute
    );
  }
}

