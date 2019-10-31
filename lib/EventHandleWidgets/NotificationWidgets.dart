import 'package:flutter/material.dart';

class NotificationWidgets extends StatefulWidget {
  @override
  _NotificationWidgetsState createState() => _NotificationWidgetsState();
}

class _NotificationWidgetsState extends State<NotificationWidgets> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('通知'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
//          RaisedButton(
//           onPressed: () => MyNotification("Hi").dispatch(context),
//           child: Text("Send Notification"),
//          ),
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      //按钮点击时分发通知
                      onPressed: () => MyNotification("Hi").dispatch(context),
                      child: Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ));
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);
  final String msg;
}
