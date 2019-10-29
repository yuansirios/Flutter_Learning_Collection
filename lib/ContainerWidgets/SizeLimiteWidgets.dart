/**
 * 尺寸限制类容器
 */
import 'package:flutter/material.dart';

class SizeLimiteWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('尺寸限制类容器'),
        actions: <Widget>[
          //UnconstrainedBox不会对子组件产生任何限制，它允许其子组件按照其本身大小绘制。
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
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
                  Text("1、ConstrainedBox用于对子组件添加额外的约束"),
                  _constrainedBox(),
                  Text("2、sizeBox"),
                  _sizeBox(),
                  Text("3、有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。"),
                  _moreLimit(),
                ])));
  }

/*
 * ConstrainedBox用于对子组件添加额外的约束。
 * 例如，如果你想让子组件的最小高度是80像素，
 * 你可以使用const BoxConstraints(minHeight: 50.0)作为子组件的约束。
 */
  Widget _constrainedBox() {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 50.0 //最小高度为50像素
          ),
      child: Container(height: 5.0, child: redBox),
    );
  }

  Widget _sizeBox() {
    Widget redBox = DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );

    return SizedBox(width: 80.0, height: 80.0, child: redBox);
  }

  Widget _moreLimit() {
    Widget yellowBox =
        DecoratedBox(decoration: BoxDecoration(color: Colors.yellow));

    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 90.0, minHeight: 20.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 60.0, minHeight: 60.0),
          child: yellowBox,
        ));
  }
}
