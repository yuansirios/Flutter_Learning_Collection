/**
 * 图片组件Image
 * 本地图片
 * 远程图片
 * 图片剪切
 */

import 'package:flutter/material.dart';

class Learn03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Content3();
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Image.network(
          'http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg',
          alignment: Alignment.center,
          width: 300,
          height: 300,
          //显示方式
          fit: BoxFit.cover,
          //混合模式
          color: Colors.blue,
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }
}

//图片圆角1
class Content1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(150),
            image: DecorationImage(
                image: NetworkImage(
                    'http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg'),
                fit: BoxFit.cover)),
      ),
    );
  }
}

//图片圆角2
class Content2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: ClipOval(
              child: Image.network(
        'http://pic16.nipic.com/20111006/6239936_092702973000_2.jpg',
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ))),
    );
  }
}

//本地图片
class Content3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Image.asset("images/a.png")    
      ),
    );
  }
}
