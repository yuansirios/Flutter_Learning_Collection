
import 'package:flutter/material.dart';

class YSTools {

  // 带边框的容器
  static Widget borderContainer(Widget widget) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xFFFF0000), width: 0.5) // 底色// 也可控件一边圆角大小
            ),
        child: widget);
  }

}