/**
 * 对齐与相对定位（Align）
 */
import 'package:flutter/material.dart';

class LayoutWithAlign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('对齐与相对定位（Align）'),
      ),
      body: _content(),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _test(),
                  _test1(),
                  _test2(),
                  _test3(),

                  //widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                    child: Center(
                      child: Text("会占用更多空间"),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Center(
                      widthFactor: 2,
                      heightFactor: 2,
                      child: Text("xxx"),
                    ),
                  )
                ])));
  }

  Widget _test() {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: Alignment.topRight,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }

/*
 * 不显式指定宽高，而通过同时指定widthFactor和heightFactor 为2也是可以达到同样的效果：
 * 因为FlutterLogo的宽高为60，则Align的最终宽高都为2*60=120。
 */
  Widget _test1() {
    return Container(
      color: Colors.green[50],
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        alignment: Alignment.topRight,
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }

/*
 Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：
(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight+childHeight/2)
 */
  Widget _test2() {
    return Container(
      color: Colors.red[50],
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        alignment: Alignment(2, 0.0),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }

/*
 * 实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)
 */
  Widget _test3() {
    return Container(
      height: 120.0,
      width: 120.0,
      color: Colors.blue[50],
      child: Align(
        alignment: FractionalOffset(0.2, 0.6),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}
