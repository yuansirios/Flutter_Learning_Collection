/*
 * 单选开关和复选框
 */

import 'package:flutter/material.dart';

class SwitchAndCheckBox extends StatefulWidget {
  @override
  _SwitchAndCheckBoxState createState() => _SwitchAndCheckBoxState();
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBox> {

  int _groupValue = 1;
  bool _switchValue = false;
  bool _flag = true;

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

  //单选框
  Widget _radioList() {
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
      width: 60,
      child: Switch(
        activeColor: Colors.green,
        value: _switchValue,
        onChanged: _switchChange,
      ),
    ));

    return Column(children: list);
  }

  //复选框
  Widget _checkBoxList(){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(children: <Widget>[
            Checkbox(
              value: this._flag,
              onChanged: (v) {
                setState(() {
                  this._flag = v;
                });
              },
              activeColor: Colors.red,
            ),
            Text(this._flag ? "选中" : "未选中")
          ]),
          SizedBox(height: 40),
          Divider(),
          CheckboxListTile(
              value: this._flag,
              onChanged: (v) {
                setState(() {
                  this._flag = v;
                });
              },
              title: Text("标题"),
              subtitle: Text("这是二级标题"),
              secondary: Icon(Icons.help))
        ],
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('单选开关和复选框'),
        ),
        body: _content());
  }

  Widget _content() {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("1、单选框"),
            _radioList(),
            Text("2、复选框"),
            _checkBoxList()
          ],
        ),
      ),
    );
  }
}