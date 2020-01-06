// 列表示例
import 'package:flutter/material.dart';
import '../Components/YSAdapterUtil.dart';

//入门篇
import '../BaseWidgets/BaseWidgets.dart';
import '../LayoutWidgets/LayoutWidgets.dart';
import '../ContainerWidgets/ContainerWidgets.dart';
import '../ScrollAbleWidgets/ScrollAbleWidgets.dart';
import '../FunctionalWidgets/FunctionalWidgets.dart';

//进阶篇
import '../EventHandleWidgets/EventHandleWidgets.dart';
import '../AnimationWidgets/AnimationWidgets.dart';
import '../CustomerWidgets/CustomerWidgets.dart';
import '../FileAndNetWidgets/FileAndNetWidgets.dart';

//学习篇
import '../Learn/LearnList.dart';

//学习篇
import '../PracticeList/DioCustomWidgets.dart';
import '../PracticeList/MoreEnvWidgets.dart';
import '../PracticeList/ListLoadMore.dart';

//国际化
import '../LocalTranslations/LocalTranslations.dart';
import '../Components/Local/Translations.dart';

class YSListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化适配器
    YSAdapterUtil.init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(Translations.of(context).text('main_title')),
        ),
        body: ListView(
          children: _getListData(context),
        ));
  }

  // 数据源
  final List _dataList = [
    {
      'section': '入门篇',
      'list': [
        {'title': '基础组件', 'component': BaseWidgets()},
        {'title': '布局类组件', 'component': LayoutWidgets()},
        {"title": "容器类组件", "component": ContainerWidgets()},
        {"title": "可滚动组件", "component": ScrollAbleWidgets()},
        {"title": "功能型组价", "component": FunctionalWidgets()},
      ]
    },
    {
      'section': '进阶篇',
      'list': [
        {"title": "事件处理与通知", "component": EventHandleWidgets()},
        {"title": "动画", "component": AnimationWidgets()},
        {"title": "自定义组件", "component": CustomerWidgets()},
        {"title": "文件操作与网络请求", "component": FileAndNetWidgets()},
        {"title": "包与插件", "component": "l"},
        {"title": "国际化", "component": LocalTranslations()},
        {"title": "核心原理", "component": ""},
      ]
    },
    {
      'section': '学习篇',
      'list': [
        {"title": "学习列表", "component": LearnList()},
      ]
    },
    {
      'section': '实战篇',
      'list': [
        {"title": "Dio网络库封装（get、post、file上传）", "component": DioCustomWidgets()},
        {"title": "多环境配置方案（开发，测试，生产）", "component": MoreEnvWidgets()},
        {"title": "列表下拉刷新+分页加载", "component": ListLoadMore()},
      ]
    },
  ];

  List<Widget> _getListData(BuildContext context) {
    var headerStyle = TextStyle(fontSize: YSAdapterUtil.setSp(40));
    var itemStyle = TextStyle(fontSize: YSAdapterUtil.setSp(30));

    List<Widget> list = List();

    for (int i = 0; i < _dataList.length; i++) {
      Widget header;
      var sectionDic = _dataList[i];
      var headerTitle = sectionDic['section'];
      if (headerTitle.length > 0) {
        header = ListTile(
          title: Text(
            "$headerTitle",
            style: headerStyle,
            textAlign: TextAlign.center,
          ),
        );
        list.add(header);
      }

      var itemList = sectionDic['list'];

      for (int j = 0; j < itemList.length; j++) {
        var item = itemList[j];
        var title = item["title"];
        list.add(Column(
          children: <Widget>[
            ListTile(
              title: Text(
                "【${j + 1}】$title",
                style: itemStyle,
              ),
              onTap: () {
                var component = item["component"];
                if (component is Widget) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => component));
                }
              },
            ),
            Divider(height: 1)
          ],
        ));
      }
    }
    return list;
  }
}
