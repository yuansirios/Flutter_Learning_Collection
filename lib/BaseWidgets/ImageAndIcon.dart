/*
 * 图片和Icon
 */

import 'package:flutter/material.dart';

class ImageAndIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('图片和Icon组件'),
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
            Text("1、加载本地图片"),
            _localImage(),
            Text("2、加载网络图片，显示方式，混合设置"),
            _imageWithNet(),
            Text("3、设置图片圆角"),
            _imageCycle(),
            Text("4、设置图片圆角2"),
            _imageCycle2(),
            Text("5、加载图标"),
            _loadIcon()
          ],
        ),
      ),
    );
  }

  //加载本地图片
  Widget _localImage() {
    return Container(child: Image.asset("images/a.png"));
  }

  //加载网络图片
  Widget _imageWithNet() {
    return Image.network(
      'http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg',
      alignment: Alignment.center,
      width: 200,
      height: 200,
      //显示方式
      fit: BoxFit.cover,
      //混合模式
      color: Colors.blue,
      colorBlendMode: BlendMode.darken,
    );
  }

  //图片圆角
  Widget _imageCycle() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(120),
          image: DecorationImage(
              image: NetworkImage(
                  'http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg'),
              fit: BoxFit.cover)),
    );
  }

  //图片圆角2
  Widget _imageCycle2() {
    return Container(
        child: ClipOval(
            child: Image.network(
      'http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg',
      width: 200,
      height: 200,
      fit: BoxFit.cover,
    )));
  }

  //加载Icon
  Widget _loadIcon() {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Text(
      icons,
      style: TextStyle(
          fontFamily: "MaterialIcons", fontSize: 50.0, color: Colors.green),
    );
  }
}
