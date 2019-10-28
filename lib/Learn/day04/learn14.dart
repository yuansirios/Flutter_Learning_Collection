
/**
 * 替换路由
 * Navigator.of(context).pushReplacementNamed('/registerThird');
 */
import 'package:flutter/material.dart';
import 'routes/Routes.dart';

class Demo extends StatelessWidget {  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home:Tabs(),   
      initialRoute: '/',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute
     
    );
  }
}
