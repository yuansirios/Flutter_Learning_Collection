/**
 * 流式布局（Wrap、Flow）
 */
import 'package:flutter/material.dart';

class LayoutWithFlow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('流式布局（Wrap、Flow）'),
      ),
      body: _content(),
    );
  }

  Widget _content() {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Wrap示例："),
                  _layoutWithWrap(),
                  Text("Flow示例："),
                  Container(
                    child: _layoutWithFlow(),
                    color: Colors.cyan,
                  )
                ])));
  }

//Wrap示例
  Widget _layoutWithWrap() {
    return Wrap(
      spacing: 4.0, // 主轴(水平)方向间距
      runSpacing: 4.0, // 纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: <Widget>[
        Container(
          color: Colors.green,
          child: Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Ha'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Hamil'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Hamilton'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Ha'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('H'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Hami'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Chip(
            avatar:
                CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
            label: Text('Ha'),
          ),
        ),
      ],
    );
  }

  //Flow示例
  Widget _layoutWithFlow() {
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.red,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.green,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.blue,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.yellow,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.brown,
        ),
        Container(
          width: 80.0,
          height: 80.0,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
