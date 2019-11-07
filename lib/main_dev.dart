
import 'package:flutter/material.dart';

import 'Components/AppConfig.dart';

import 'RootView/RootView.dart';
import 'ContainerWidgets/Routes/Routes.dart';

void main() {
  AppConfig.env = EnvType.EnvType_Dev;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: onGenerateRoute,
        home: RootView());
  }
}