import 'package:flutter/material.dart';

import '../ScaffoldWidgets.dart';
import '../Pages/PageThree.dart';
import '../Pages/PageDetail.dart';
import '../Pages/PageDetail2.dart';

//配置路由
final routes={
      '/':(context)=>ScaffoldWidgets(),
      '/three':(context)=>PageThree(),
      '/detail':(context,{arguments})=>PageDetail(arguments:arguments),
      '/detail2':(context,{arguments})=>PageDetail2(arguments:arguments),
};

//固定写法
RouteFactory onGenerateRoute = (RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }else{
        return null;
      }
};