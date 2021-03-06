import 'package:flutter/material.dart';

class GridViewWidgets extends StatefulWidget {
  @override
  _GridViewWidgetsState createState() => _GridViewWidgetsState();
}

class _GridViewWidgetsState extends State<GridViewWidgets> {
  List<IconData> _icons = []; //保存Icon数据

  @override
  void initState() {
    super.initState();
    // 初始化数据
    _retrieveIcons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Scrollbar(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, //每行三列
                  childAspectRatio: 1.0 //显示区域宽高相等
                  ),
              itemCount: _icons.length,
              itemBuilder: (context, index) {
                //如果显示到最后一个并且Icon总数小于200时继续获取数据
                if (index == _icons.length - 1 && _icons.length < 200) {
                  _retrieveIcons();
                }
                return Icon(_icons[index]);
              })),
    );
  }

  //模拟异步获取数据
  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}
