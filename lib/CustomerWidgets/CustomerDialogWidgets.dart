import 'package:flutter/material.dart';
import '../Components/Dialog/YSDialog.dart';

class CustomerDialogWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    YSDialog.init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('自定义弹框'),
        ),
        body: Center(
            child: UnconstrainedBox(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: Text("自定义加载弹框"), onPressed: _loadSourceDialog),
              RaisedButton(
                  child: Text("自定义Alert弹框"), onPressed: _loadAlertDialog),
              RaisedButton(
                  child: Text("Alert弹框内容很多"), onPressed: _loadAlertDialogMore),
              RaisedButton(
                  child: Text("自定义Toast弹框"), onPressed: _loadToastDialog),
              RaisedButton(
                  child: Text("Toast弹框内容很多"), onPressed: _loadToastDialogMore),
            ],
          ),
        )));
  }

  _loadSourceDialog() async {
    YSDialog.showLoading("数据加载中");
    await Future.delayed(Duration(milliseconds: 2000));
    YSDialog.dismiss();
  }

  _loadAlertDialog() {
    YSDialog.showAlert(
        "我是标题",
        "我是内容内容内容内容内容",
        (int index) {
      print("点击了：$index");
    });
  }

  _loadAlertDialogMore() {
    YSDialog.showAlert(
        "标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题",
        "内容内容内容内容内内容内容内内容内容内容内容内内容内容内内容内容内容内容内容内内容内容内内容内容内容内容内容内内容内容内内容内容内容内容内内容内容内容内容内容内容内内容内容内容内内容内容内内容内容内容内容内内容内容内内容内容内容内容内内容内容内容内内容内容内内容内容内容内容内内容内容内内容内容内容内容内内容内容内容内内容内容内内容内容内容内容内内容内容内内容内容内容内容内内容内容内容内内容内容内内容内容内容内容内内容内容内内容内容内容内容内内容内容内容内内容内容内内容内容内容内容内内容内容内内容内容内容内容内内容内容内",
        (int index) {
      print("点击了：$index");
    });
  }

  _loadToastDialog() {
    YSDialog.showToast("我是一个toast");
  }

  _loadToastDialogMore() {
    YSDialog.showToast("我是一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toas一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast我是一个toast");
  }
}
