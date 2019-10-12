import 'package:flutter/material.dart';

import 'day03/learn12.dart';

void main() => runApp(Learn12());

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
