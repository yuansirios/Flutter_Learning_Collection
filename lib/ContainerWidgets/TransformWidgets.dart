/**
 * 变换（Transform）
 */
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('变换（Transform）'),
      ),
      body: _baseView(),
    );
  }

  Widget _baseView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
        child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("1、角度变换"),
                  SizedBox(
                    height: 50,
                  ),
                  _test1(),
                  _title("2、平移"),
                  _test2(),
                  _title("3、旋转"),
                  _test3(),
                  _title("4、缩放"),
                  _test4(),
                  _title("5、RotatedBox"),
                  _test5(),
                ])));
  }

  Widget _title(String title){
    return Container(
                    padding: EdgeInsets.all(40),
                    child: Text("$title"),
                  );
  }

//角度变换
  Widget _test1() {
    return Container(
      color: Colors.black,
      child: new Transform(
        alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
        transform: new Matrix4.skewY(0.3), //沿Y轴倾斜0.3弧度
        child: new Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.deepOrange,
          child: const Text('Apartment for rent!'),
        ),
      ),
    );
  }

//平移
  Widget _test2() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      //默认原点为左上角，左移20像素，向上平移5像素
      child: Transform.translate(
        offset: Offset(-20.0, -5.0),
        child: Text("Hello world"),
      ),
    );
  }

//旋转
  Widget _test3() {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
      child: Transform.rotate(
        //旋转90度
        angle: math.pi / 2,
        child: Text("Hello world"),
      ),
    );
  }

//缩放
  Widget _test4() {
    return DecoratedBox(
        decoration: BoxDecoration(color: Colors.red),
        child: Transform.scale(
            scale: 1.5, //放大到1.5倍
            child: Text("Hello world")));
  }

/*
 * RotatedBox和Transform.rotate功能相似，它们都可以对子组件进行旋转变换，
 * 但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小。
 */
  Widget _test5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          //将Transform.rotate换成RotatedBox
          child: RotatedBox(
            quarterTurns: 1, //旋转90度(1/4圈)
            child: Text("Hello world"),
          ),
        ),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        )
      ],
    );
  }
}
