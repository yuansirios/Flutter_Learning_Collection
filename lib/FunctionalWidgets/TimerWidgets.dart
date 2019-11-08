import 'dart:async';
import 'package:flutter/material.dart';

import '../Components/Dialog/YSDialog.dart';

class TimerWidgets extends StatefulWidget {
  @override
  _TimerWidgetsState createState() => _TimerWidgetsState();
}

class _TimerWidgetsState extends State<TimerWidgets> {
  Timer _countdownTimer;
  String _codeCountdownStr = '获取验证码';
  int _countdownNum = 5;

  void _reGetCountdown() {
    setState(() {
      if (_countdownTimer != null) {
        return;
      }
      _codeCountdownStr = '${_countdownNum--}重新获取';
      _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          if (_countdownNum > 0) {
            _codeCountdownStr = '${_countdownNum--}重新获取';
          } else {
            _codeCountdownStr = '获取验证码';
            _countdownNum = 5;
            _countdownTimer.cancel();
            _countdownTimer = null;
          }
        });
      });
    });
  }

  void _afterEvent() {
    YSDialog.showLoading("正在呼叫……");
    Timer(Duration(seconds: 3), () {
      YSDialog.dismiss();
      YSDialog.showToast("你叫我干嘛！！！");
    });
  }

  // 不要忘记在这里释放掉Timer
  @override
  void dispose() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    YSDialog.init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('定时器详解'),
        ),
        body: Center(
          child: UnconstrainedBox(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  child: Text("3s后呼叫队友"),
                  onPressed: _afterEvent,
                ),
                RaisedButton(
                  textColor: Colors.white,
                  color: _countdownTimer == null ? Colors.blue : Colors.grey,
                  child: Text("$_codeCountdownStr"),
                  onPressed: _reGetCountdown,
                )
              ],
            ),
          ),
        ));
  }
}
