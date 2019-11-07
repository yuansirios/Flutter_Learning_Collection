import 'dart:io';

import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart'; //toast
import 'package:image_picker/image_picker.dart';

import '../Utils/Api.dart';
import '../Utils/ResultData.dart';

class DioCustomWidgets extends StatefulWidget {
  @override
  _DioCustomWidgetsState createState() => _DioCustomWidgetsState();
}

class _DioCustomWidgetsState extends State<DioCustomWidgets> {
  String resultStr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dio网络库封装'),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("get测试请求"),
                      onPressed: getRequest,
                    ),
                    RaisedButton(
                      child: Text("post测试请求"),
                      onPressed: postRequest,
                    ),
                    RaisedButton(
                      child: Text("拍照上传"),
                      onPressed: () => getImage(),
                    ),
                    Text("$resultStr"),
                    SizedBox(
                        width: 200,
                        height: 200,
                        child: _image == null ? null : Image.file(_image))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void getRequest() async {
    ResultData data = await Api.request(1, 10);
    var res = data.body;
    if (data.success) {
      res = "请求成功" + res.toString();
    } else {
      res = "请求失败" + data.errMsg.toString();
    }
    setState(() {
      resultStr = res;
    });
  }

  void postRequest() async {
    ResultData data = await Api.shelfwarequery(1, 10);
    var res = data.body;
    if (data.success) {
      res = "请求成功" + res.toString();
    } else {
      res = "请求失败" + data.errMsg.toString();
    }
    setState(() {
      resultStr = res;
    });
  }

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    _upLoadImage(image); //上传图片
    setState(() {
      _image = image;
    });
  }

  //上传图片
  _upLoadImage(File image) async {
    ResultData data = await Api.uploadImage(image);
    var res = data.body;
    setState(() {
      resultStr = res.toString();
    });

    if (data.success) {
      res = "请求成功";
    } else {
      res = "请求失败";
    }

    Fluttertoast.showToast(
        msg: res, gravity: ToastGravity.CENTER, textColor: Colors.grey);
  }
}
