import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_flutter/type_box_widget.dart';
import 'package:webview_plugin/webview_plugin.dart';
import 'battery_widget.dart';
import 'echo_widget.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case 'route1':
      return MaterialApp(
        home: Scaffold(
          body: BatteryWidget(),
        ),
      );
    case 'route2':
      return MyApp();
    case 'route3':
      return ParentWidget();
    default:
      return Center(
        child: Echo(
          text: "rex",
        ),
      );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Webview',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();

  @override
  initState() {}
}

class _MyHomePageState extends State<MyHomePage> {
  var title = "demo";

  final flutterWebviewPlugin = new WebviewPlugin();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Center(
      child: new RaisedButton(onPressed: () {
        flutterWebviewPlugin.launch(
            "https://blog.csdn.net/qq_16247851/article/details/81210771",
            (data) {
          setState(() {
            title = data;
          });
        },
            rect: new Rect.fromLTWH(0.0, 0.0, MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height));
      }),
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
