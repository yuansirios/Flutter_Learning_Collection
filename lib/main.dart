import 'package:flutter/material.dart';

import 'day02/learn11.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter'),
          ),
          body: Learn11()
        ));
  }
}
