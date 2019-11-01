/*
 * 日志拦截器
 */
import 'package:dio/dio.dart';

class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    print("请求baseUrl：${options.baseUrl}");
    print("请求url：${options.path}");
    print('请求headers: ' + options.headers.toString());

    Future<dynamic> future = Future(() async {
      if (options.data != null) {
        print('请求参数: ' + options.data.toString());
      }
    });
    return future.then((value) {
      return options;
    }); 
  }

  @override
  onResponse(Response response) {
    Future<dynamic> future = Future(() async {
      if (response != null) {
        var responseStr = response.toString();
        print("请求返回$responseStr");
      }
    });
    return future.then((value) {
      return response;
    });
  }

  @override
  onError(DioError err) {
    Future<dynamic> future = Future(() async {
      print('请求异常: ' + err.toString());
      print('请求异常信息: ' + err.response?.toString() ?? "");
    });
    return future.then((value) {
      return err;
    });
  }
}
