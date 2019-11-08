import 'package:flutter/material.dart';
import '../YSTools.dart';

enum YSDialogType {
  YSDialogType_loading,
  YSDialogType_alert,
  YSDialogType_toast,
}

class YSDialog extends Dialog {
  static BuildContext currentContext;
  Size frameSize;
  String title;
  String message;
  YSDialogType showType;
  final eventBlock;

  YSDialog(
      {Key key,
      @required this.title,
      this.message = "",
      @required this.showType,
      this.eventBlock})
      : super(key: key);

  static init(BuildContext context) {
    currentContext = context;
  }

  //显示弹框
  static showAlert(String title, String message, clickBlock) {
    showDialog<Null>(
        context: currentContext, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return YSDialog(
            title: title,
            message: message,
            showType: YSDialogType.YSDialogType_alert,
            eventBlock: clickBlock,
          );
        });
  }

  //显示loading弹框
  static showLoading(String title) {
    showDialog<Null>(
        context: currentContext, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return YSDialog(
            title: title,
            showType: YSDialogType.YSDialogType_loading,
          );
        });
  }

  //显示loading弹框
  static showToast(String title) async {
    showDialog<Null>(
        context: currentContext, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return YSDialog(
            title: title,
            showType: YSDialogType.YSDialogType_toast,
          );
        });

    await Future.delayed(Duration(milliseconds: 2000));
    dismiss();
  }

  //显示loading弹框
  static showBottomSheet(String title) async {


    await Future.delayed(Duration(milliseconds: 2000));
    dismiss();
  }

  //关闭弹框
  static dismiss() {
    Navigator.pop(currentContext);
  }

  Widget _loadingView() {
    return SizedBox(
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
                title,
                style: TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _alertView() {
    return Center(
      child: Container(
          decoration: ShapeDecoration(
            color: Color(0xffffffff),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          child: UnconstrainedBox(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  //标题
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: 30,
                          minWidth: frameSize.width - 100,
                          maxHeight: 200,
                          maxWidth: frameSize.width - 100),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: YSTools.borderContainer(Text(
                            title,
                            style: TextStyle(fontSize: 24),
                            maxLines: 3,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )))),
                  //内容
                  ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: frameSize.width - 100,
                        maxWidth: frameSize.width - 100,
                        maxHeight: 400,
                      ),
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: YSTools.borderContainer(SingleChildScrollView(
                              child: Text(
                            message,
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ))))),
                  ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: frameSize.width - 100,
                          maxWidth: frameSize.width - 100),
                      child: Column(
                        children: <Widget>[
                          Divider(
                            height: 3,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                width: 100,
                                child: FlatButton(
                                    child: Text("确定"),
                                    onPressed: _alertConfirm),
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: Colors.grey,
                              ),
                              Container(
                                width: 100,
                                child: FlatButton(
                                    child: Text("取消"), onPressed: _alertCancel),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          )),
    );
  }

  Widget _toastView() {
    return Center(
      child: Container(
          decoration: ShapeDecoration(
            color: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
          ),
          child: UnconstrainedBox(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight: frameSize.height - 100, 
                      minWidth: 100,
                      maxWidth: frameSize.width - 100),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: YSTools.borderContainer(SingleChildScrollView(
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                      )))),
            ),
          )),
    );
  }

  _alertConfirm() {
    YSDialog.dismiss();
    eventBlock(0);
  }

  _alertCancel() {
    YSDialog.dismiss();
    eventBlock(1);
  }

  @override
  Widget build(BuildContext context) {
    frameSize = MediaQuery.of(context).size;
    Widget showView;

    if (showType == YSDialogType.YSDialogType_loading) {
      showView = _loadingView();
    } else if (showType == YSDialogType.YSDialogType_alert) {
      showView = _alertView();
    } else {
      showView = _toastView();
    }

    return Material(
      //创建透明层
      type: MaterialType.transparency, //透明类型
      child: Center(
          //保证控件居中效果
          child: showView),
    );
  }
}
