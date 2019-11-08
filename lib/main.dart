import 'package:flutter/material.dart';

import 'RootView/RootView.dart';
import 'ContainerWidgets/Routes/Routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        onGenerateRoute: onGenerateRoute,
        home: RootView());
  }
}
