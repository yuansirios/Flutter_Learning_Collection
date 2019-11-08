import 'package:flutter/material.dart';

class LoadingDialog extends Dialog {
  final String text;
  static BuildContext currentContext;

  LoadingDialog({Key key, @required this.text}) : super(key: key);

  static init(BuildContext context){
    currentContext = context;
  }

  //显示弹框
  static showLoading(String title){
    showDialog<Null>(
    context: currentContext, //BuildContext对象
    barrierDismissible: false,
    builder: (BuildContext context) {
        return LoadingDialog( //调用对话框
            text: title,
        );
    });
  }

  //关闭弹框
  static dismiss(){
    Navigator.pop(currentContext);
  }

  @override
  Widget build(BuildContext context) {
    return Material( //创建透明层
      type: MaterialType.transparency, //透明类型
      child: Center( //保证控件居中效果
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Container(
            decoration: ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}