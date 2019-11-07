
import 'dart:io';
import 'DataHelper.dart';
import 'HttpManager.dart';
import 'Address.dart';

class Api {
  ///示例请求
  static request(int page,int pageSize) {
    var params = DataHelper.getBaseMap();
    params['page'] = page;
    params['pageSize'] = pageSize;
    return HttpManager.getInstance().get(Address.TEST_API, params);
  }

  //请求车辆列表
  static shelfwarequery(int page,int pageSize) {
    var params = DataHelper.getBaseMap();
    params['page'] = page;
    params['pageSize'] = pageSize;
    return HttpManager.getInstance().post(Address.TEST_API, params);
  }

  //请求车辆列表
  static uploadImage(File file) {
    return HttpManager.getInstance().uploadFile(Address.UPLOAD_IMG, file);
  }
}