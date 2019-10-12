import 'package:flutter/material.dart';
import '../pages/Tabs.dart';
import '../pages/Search.dart';
import '../pages/Form.dart';

final Map<String, Function> routes = {
  '/': (contxt, {arguments}) => Tabs(),
  '/search': (contxt, {arguments}) => SearchPage(arguments: arguments),
  '/from': (context, {arguments}) => FormPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    final Route route = MaterialPageRoute(
        builder: (context) =>
            pageContentBuilder(context, arguments: settings.arguments));
    return route;
  }
};
