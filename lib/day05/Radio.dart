import 'package:flutter/material.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int _groupValue = 1;
  bool _switchValue = false;

  _handelChange(v) {
    setState(() {
      this._groupValue = v;
    });
  }

  _switchChange(v) {
    setState(() {
      this._switchValue = v;
    });
  }

  //效果一样
  // Content({Key key}) : super(key: key) {
  List<Widget> _radioList() {
    List<Widget> list = List();
    int count = 3;
    for (var i = 0; i < count; i++) {
      list.add(Radio(
        value: i,
        onChanged: _handelChange,
        activeColor: Colors.red,
        groupValue: _groupValue,
      ));
    }
    list.add(Divider());
    list.add(
      RadioListTile(
        value: count + 1,
        title: Container(
          height: 60,
          child: (Text("这是文本")),
          color: Colors.red,
        ),
        subtitle: Text("这是子文本"),
        secondary: Icon(Icons.help),
        groupValue: _groupValue,
        onChanged: _handelChange,
      ),
    );

    list.add(Divider());
    list.add(
      RadioListTile(
        value: count + 2,
        title: Container(
          height: 60,
          child: (Text("这是文本")),
          color: Colors.red,
        ),
        subtitle: Text("这是子文本"),
        secondary: Icon(Icons.help),
        groupValue: _groupValue,
        onChanged: _handelChange,
      ),
    );

    list.add(Container(
      width: 90,
      child: Switch(
        activeColor: Colors.green,
        value: _switchValue,
        onChanged: _switchChange,
      ),
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Radio选中了${this._groupValue}'),
        ),
        body: Column(children: _radioList()));
  }
}
