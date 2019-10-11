//GridView组件 以及动态GridView

import 'package:flutter/material.dart';
import 'res/listData.dart';

class Learn06 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Demo3();
  }
}

//示例1
class Demo1 extends StatelessWidget {  
  @override
  Widget build(BuildContext context) {    
    return GridView.count(

        crossAxisCount: 2,  //一行的 Widget 数量
        children: <Widget>[
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本'),
          Text('这是一个文本')
        ],
    );
  }
}

//示例2
class Demo2 extends StatelessWidget {  

  List<Widget> _getListData() {
      List<Widget> list = new List();

      for (var i = 0; i < 20; i++) {
        list.add(Container(
          alignment: Alignment.center,
          child: Text(
            '这是第$i条数据',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          color: Colors.blue,        
          // height: 400,  //设置高度没有反应
        ));
      }
      return list;
  }

  @override
  Widget build(BuildContext context) {    
    return GridView.count(
        crossAxisSpacing:20.0 ,   //水平子 Widget 之间间距
        mainAxisSpacing: 20.0,    //垂直子 Widget 之间间距
        padding: EdgeInsets.all(20),
        crossAxisCount: 2,  //一行的 Widget 数量
        childAspectRatio:0.7,  //宽度和高度的比例
        children: this._getListData(),
    );
  }
}

//GridView.count实现网格布局
class Demo3 extends StatelessWidget {
  List<Widget> _getData() {
    var tempList = listData.map((value) {
      return Container(
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            SizedBox(height: 10),
            Text(
              value["title"],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        decoration: BoxDecoration(
            border: Border.all(
                color: Color.fromRGBO(230, 230, 230, 0.9), width: 1.0)),
      );
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      //内边距
      padding: EdgeInsets.all(20),
      //一行的个数
      crossAxisCount: 2,
      //水平子控件之间间距
      crossAxisSpacing: 20,
      //垂直子控件间距
      mainAxisSpacing: 20,
      //子控件宽高比例
      childAspectRatio: 0.8,
      children: this._getData(),
    );
  }
}

//GridView.builder实现网格布局
class Demo4 extends StatelessWidget {
  Widget _getListData(context, index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(listData[index]["imageUrl"]),
          SizedBox(height: 5),
          Text(
            listData[index]["title"],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Color.fromRGBO(230, 230, 230, 0.9), width: 1.0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //横轴元素个数
        crossAxisCount: 2,
        //横轴间距
        crossAxisSpacing: 20,
        //纵轴间距
        mainAxisSpacing: 20,
        //子控件宽高比例
        childAspectRatio: 1.0,
      ),
      padding: EdgeInsets.all(20),
      itemBuilder: this._getListData,
    );
  }
}
