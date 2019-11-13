import 'package:flutter/material.dart';

class AnimatedDecorated extends StatefulWidget {
  @override
  _AnimatedDecoratedState createState() => _AnimatedDecoratedState();
}

class _AnimatedDecoratedState extends State<AnimatedDecorated> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('动画过渡组件'),
      // ),
      body: Container(
          child: AnimatedDecoratedBox(
        duration: duration,
        decoration: BoxDecoration(color: _decorationColor),
        child: FlatButton(
          onPressed: () {
            setState(() {
              _decorationColor = Colors.red;
            });
          },
          child: Text(
            "AnimatedDecoratedBox",
            style: TextStyle(color: Colors.white),
          ),
        ),
      )),
    );
  }
}

class AnimatedDecoratedBox extends StatefulWidget {
  AnimatedDecoratedBox({
    Key key,
    @required this.decoration,
    this.child,
    this.curve = Curves.linear,
    @required this.duration,
    this.reverseDuration,
  });

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration reverseDuration;

  @override
  _AnimatedDecoratedBoxState createState() => _AnimatedDecoratedBoxState();
}

class _AnimatedDecoratedBoxState extends State<AnimatedDecoratedBox>
    with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  AnimationController _controller;

  Animation<double> get animation => _animation;
  Animation<double> _animation;

  DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画过渡组件'),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return DecoratedBox(
            decoration: _tween.animate(_animation).value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    if (widget.curve != null)
      _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    else
      _animation = _controller;
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;
      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
