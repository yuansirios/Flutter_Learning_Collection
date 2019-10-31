import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class GestureDetectorWidgets extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorWidgets> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();
  bool _toggle = false;

  String _operation = "No Gesture detected!"; //保存事件名

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('手势识别'),
        ),
        body: ConstrainedBox(
            constraints: BoxConstraints(minWidth: double.infinity),
            child: Column(
              children: <Widget>[
                Text('点击、双击、长按'),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    width: 200.0,
                    height: 100.0,
                    child: Text(
                      _operation,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () => updateText("Tap"), //点击
                  onDoubleTap: () => updateText("DoubleTap"), //双击
                  onLongPress: () => updateText("LongPress"), //长按
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(text: "你好世界"),
                  TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: _toggle ? Colors.blue : Colors.red),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      },
                  ),
                  TextSpan(text: "你好世界"),
                ]))
              ],
            )));
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
