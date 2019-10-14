import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*
 * 按钮组件 RaisedButton、
 * FlatButton、
 * OutlineButton、
 * IconButton、
 * ButtonBar以及自定义按钮组件
 */

class Demo extends StatelessWidget {

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('按钮组件'),
        ),
        floatingActionButton: Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(8),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: this._currentIndex==1?Colors.red:Colors.yellow,
            onPressed: (){
              // setStat
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Content());
  }
}

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("普通按钮"),
                onPressed: () {
                  print("普通按钮点击了");
                },
              ),
              SizedBox(width: 20),
              RaisedButton(
                child: Text('有颜色的按钮'),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  print('有颜色的按钮点击了');
                },
              ),
              SizedBox(width: 20),
              RaisedButton(
                child: Text('阴影按钮'),
                textColor: Colors.white,
                color: Colors.blue,
                elevation: 10,
                onPressed: () {
                  print('阴影按钮点击了');
                },
              )
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: RaisedButton.icon(
                    icon: Icon(Icons.search),
                    label: Text('图标按钮'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      print("图标按钮点击了");
                    }),
              ),
              Container(
                height: 80,
                child: RaisedButton(
                      child: Text('圆形按钮'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      //背景阴影
                      elevation: 20,
                      //点击颜色
                      splashColor: Colors.red,
                      shape:
                          CircleBorder(side: BorderSide(color: Colors.white)),
                      onPressed: () {
                        print("圆形按钮");
                      }),
              ),
              Container(
                child: FlatButton(
                  child: Text("按钮"),
                  color: Colors.blue,
                  textColor: Colors.yellow,
                  onPressed: () {
                    print('FlatButton');
                  },
                ),
              ),

            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  height: 60,
                  width: 200,
                  child: RaisedButton(
                    child: Text('有宽高的按钮'),
                    textColor: Colors.white,
                    color: Colors.blue,
                    elevation: 10,
                    onPressed: () {
                      print('有宽高的按钮点击了');
                    },
                  ))
            ],
          ),
          SizedBox(height: 40),
          /*
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Container(
                height: 60,
                margin: EdgeInsets.all(20),
                child: RaisedButton(
                  child: Text('全屏按钮'),
                  textColor: Colors.white,
                  color: Colors.blue,
                  elevation: 10,
                  onPressed: () {
                    print('全屏按钮点击了');
                  },
                ),
              ))
            ],
          ),
          */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 60,
                  margin: EdgeInsets.all(20),
                  child: RaisedButton(
                    child: Text('带圆角的按钮'),
                    textColor: Colors.white,
                    color: Colors.blue,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      print('带圆角的按钮点击了');
                    },
                  ),
                ),
              )
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ButtonBar(
                  children: <Widget>[

                    RaisedButton(
                      child: Text('登录'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("宽度高度");
                      },
                    ),
                    RaisedButton(
                      child: Text('注册'),
                      color: Colors.blue,
                      textColor: Colors.white,
                      elevation: 20,
                      onPressed: () {
                        print("宽度高度");
                      },
                    ),
                    MyButton(text: "自定义按钮",height: 60.0,width: 100.0,pressed: (){
                      print('自定义按钮');
                    })
                    
                  ],
                )
              ],
            )
        ],
      ),
    );
  }
}


//自定义按钮组件
class MyButton extends StatelessWidget {
  final text;
  final pressed;
  final width;
  final height;
  const MyButton({this.text='',this.pressed=null,this.width=80,this.height=30}) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      child: RaisedButton(
        child: Text(this.text),
        onPressed:this.pressed ,
      ),
    );
  }
}