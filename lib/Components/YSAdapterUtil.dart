
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YSAdapterUtil {

  static init(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  }
  
  // 字体适配
  static num setSp(num fontSize) => ScreenUtil().setSp(fontSize);
  // 适配高度
  static num setHeight(num height) => ScreenUtil().setHeight(height);
  // 适配宽度
  static num setWidth(num width) => ScreenUtil().setWidth(width);
}