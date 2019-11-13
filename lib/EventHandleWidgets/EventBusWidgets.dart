import 'package:flutter/material.dart';
import '../Components/EventBus.dart';

class EventBusWidgets extends StatefulWidget {
  @override
  _EventBusWidgetsState createState() => _EventBusWidgetsState();
}

class _EventBusWidgetsState extends State<EventBusWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('全局事件总线'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("登录成功"),
              onPressed: _loginSuccess,
            )
          ],
        ),
      ),
    );
  }

  _loginSuccess() {
    bus.emit("login", {"key":"登录成功了"});
  }
}
