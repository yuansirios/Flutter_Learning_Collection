import 'package:flutter/material.dart';
import '../Components/Local/Translations.dart';
import '../Components/Local/application.dart';

class LocalTranslations extends StatefulWidget {
  @override
  _LocalTranslationsState createState() => _LocalTranslationsState();
}

class _LocalTranslationsState extends State<LocalTranslations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.of(context).text('local_title')),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("显示英文"),
              onPressed: (){
                applic.onLocaleChanged(Locale('en',''));
              },
            ),
            RaisedButton(
              child: Text("显示中文"),
              onPressed: (){
                applic.onLocaleChanged(Locale('zh',''));
              },
            ),
            RaisedButton(
              child: Text("显示日语"),
              onPressed: (){
                applic.onLocaleChanged(Locale('jp',''));
              },
            )
          ],
        ),
      ),
    );
  }
}