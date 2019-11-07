import 'package:flutter/material.dart';
import '../Components/AppConfig.dart';

class MoreEnvWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('环境信息'),
      ),
      body: Center(
        child: Text(
          "${AppConfig.appName}",
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
