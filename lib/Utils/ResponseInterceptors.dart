/*
 * 响应拦截器
 */

import 'package:dio/dio.dart';
import 'ResultData.dart';
import 'Code.dart';

class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) {
    RequestOptions option = response.request;
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {

        bool work = true;
        var success = response.data["success"];
        if (success == 'false' || success == 0 || success == 'NO' ){
          work = false;
        }
        if (work) {
          Future<dynamic> future = Future(() async {});
          return future.then((value) {
            return ResultData(response.data["body"], true, Code.SUCCESS,
                headers: response.headers);
          });
        } else {
          Future<dynamic> future = Future(() async {});
          return future.then((value) {
            return ResultData(response.data, false, Code.FAILE,
                headers: response.headers, errMsg: response.data["errMsg"]);
          });
        }
      } else {
        Future<dynamic> future = Future(() async {});
        return future.then((value) {
          return ResultData(response.data, false, response.statusCode,
              headers: response.headers);
        });
      }
    } catch (e) {
      print("请求异常：" + e.toString() + "路径：" + option.path);

      Future<dynamic> future = Future(() async {});
      return future.then((value) {
        return ResultData(response.data, false, response.statusCode,
            headers: response.headers);
      });
    }
  }
}
