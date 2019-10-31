import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/User.dart';

class JsonToModel extends StatefulWidget {
  @override
  _JsonToModelState createState() => _JsonToModelState();
}

class _JsonToModelState extends State<JsonToModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('JSON转Modle'),
        ),
        body: Container(
            child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('tool/json/User.json'),
                builder: (context, snapshot) {
                  Map userMap = json.decode(snapshot.data.toString());
                  var user = new User.fromJson(userMap);
                  return Column(
                    children: <Widget>[
                      Text('Howdy, ${user.name}!'),
                      Text('We sent the verification link to ${user.email}.')
                    ],
                  );
                })));
  }
}
