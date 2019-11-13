import 'package:flutter/material.dart';

import 'Components/AppConfig.dart';

import 'RootView/RootView.dart';
import 'ContainerWidgets/Routes/Routes.dart';

import './Components/Local/Translations.dart';
import './Components/Local/application.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  AppConfig.env = EnvType.EnvType_Dev;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SpecificLocalizationDelegate _localeOverrideDelegate;
   
  @override
  void initState(){
    super.initState();
    /// 初始化一个新的Localization Delegate，有了它，
    /// 当用户选择一种新的工作语言时，可以强制初始化一个新的Translations
    _localeOverrideDelegate = SpecificLocalizationDelegate(null);

    /// 保存这个方法的指针，当用户改变语言时，
    /// 我们可以调用applic.onLocaleChanged(new Locale('en',''));
    /// 通过SetState()我们可以强制App整个刷新
    applic.onLocaleChanged = onLocaleChange;
  }

/// 改变语言时的应用刷新核心，每次选择一种新的语言时，
/// 都会创造一个新的SpecificLocalizationDelegate实例，强制Translations类刷新。
  onLocaleChange(Locale locale){
    setState((){
      _localeOverrideDelegate = SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootView(),
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: onGenerateRoute,
      //国际化配置
      localizationsDelegates: [
        _localeOverrideDelegate,  // 注册一个新的delegate
        const TranslationsDelegate(), // 指向默认的处理翻译逻辑的库
        // 本地化的代理类
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: applic.supportedLocales(),
      localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
        print('当前语言环境是: $locale ，$supportedLocales');
      }, 
    );
  }
}
