import 'package:flutter/material.dart';
import 'StaggerAnimationWidgets.dart';
import 'AnimatedSwitcherCounterRoute.dart';
import 'AnimatedDecorated.dart';
import 'AnimatedWidgetsTest.dart';

class AnimationWidgets extends StatefulWidget {
  @override
  _AnimationWidgetsState createState() => _AnimationWidgetsState();
}

class _AnimationWidgetsState extends State<AnimationWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("放大动画"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScaleAnimationRoute()));
              },
            ),
            RaisedButton(
              child: Text("自定义过渡动画"),
              onPressed: () {
                _customPushAnimation(context);
              },
            ),
            RaisedButton(
              child: Text("Hero动画"),
              onPressed: () {
                _heroAnimation(context);
              },
            ),
            RaisedButton(
              child: Text("交织动画"),
              onPressed: () {
                _staggerAnimation(context);
              },
            ),
            RaisedButton(
              child: Text("AnimatedSwitcher"),
              onPressed: () {
                _switcherAnimation(context);
              },
            ),
            RaisedButton(
              child: Text("动画过渡组件"),
              onPressed: () {
                _animatedDecoratedBox(context);
              },
            ),
            RaisedButton(
              child: Text("预置的动画过渡组件"),
              onPressed: () {
                _animatedTest(context);
              },
            )
          ],
        ),
      ),
    );
  }
}

_customPushAnimation(BuildContext context) {
  Navigator.push(context, FadeRoute(builder: (context) {
    return ScaleAnimationRoute();
  }));
}

_heroAnimation(BuildContext context) {
  Navigator.push(context, FadeRoute(builder: (context) {
    return HeroAnimationRoute();
  }));
}

_staggerAnimation(BuildContext context) {
  Navigator.push(context, FadeRoute(builder: (context) {
    return StaggerAnimationWidgets();
  }));
}

_switcherAnimation(BuildContext context) {
  Navigator.push(context, FadeRoute(builder: (context) {
    return AnimatedSwitcherCounterRoute();
  }));
}

_animatedDecoratedBox(BuildContext context) {
  Navigator.push(context, FadeRoute(builder: (context) {
    return AnimatedDecorated();
  }));
}

_animatedTest(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return AnimatedWidgetsTest();
  }));
}


/* 放大动画 */
class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  String animationStatus;

  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addListener(() {
        setState(() => {});
      });

    animation.addStatusListener((status) {
      String statusStr;
      if (status == AnimationStatus.completed) {
        statusStr = "动画完成，反向动画";
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        statusStr = "动画停止，又开始";
        // //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      } else if (status == AnimationStatus.reverse) {
        statusStr = "动画反向";
      } else if (status == AnimationStatus.forward) {
        statusStr = "动画开始";
      }

      setState(() => {animationStatus = statusStr});
    });

    //启动动画(正向执行)
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('放大动画'),
        ),
        body:

            // AnimatedImage(animation: animation)
            Column(
          children: <Widget>[
            GrowTransition(
              child: Container(
                  width: animation.value,
                  height: animation.value,
                  color: Colors.red,
                  child: Text("$animationStatus")),
              animation: animation,
            )
          ],
        ));
  }

  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

//抽离动画元素
class AnimatedImage extends AnimatedWidget {
  AnimatedImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
        child: Container(
            width: animation.value,
            height: animation.value,
            color: Colors.red,
            child: Text("放大动画")));
  }
}

//封装AnimatedBuilder
class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget child) {
            return Container(
                height: animation.value, width: animation.value, child: child);
          },
          child: child),
    );
  }
}

//自定义过渡动画
class FadeRoute extends PageRoute {
  FadeRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 300),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    //当前路由被激活，是打开新路由
    // if (isActive) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
    // } else {
    //   //是返回，则不应用过渡动画
    //   return Padding(padding: EdgeInsets.zero);
    // }
  }
}

// Hero动画，点击查看大图效果
class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hero动画'),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
              child: ClipOval(
                child: Image.asset(
                  "images/a.png",
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              //打开B路由
              Navigator.push(context, PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("原图"),
                    ),
                    body: HeroAnimationRouteB(),
                  ),
                );
              }));
            },
          ),
        ));
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset("images/a.png"),
      ),
    );
  }
}
