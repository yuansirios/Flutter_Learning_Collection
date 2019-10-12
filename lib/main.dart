import 'package:flutter/material.dart';

import 'day03/learn13.dart';

void main() => runApp(Learn13());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter'),
          ),
          // body: Learn11()
        ));
  }
}
