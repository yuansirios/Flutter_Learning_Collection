class ResultData {
  var body;
  bool success;
  int errCode;
  String errMsg;
  var headers;

  ResultData(this.body, this.success, this.errCode, {this.headers,this.errMsg});
}