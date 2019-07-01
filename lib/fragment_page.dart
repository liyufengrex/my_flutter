import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FragmentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FragmentPageState();
  }

}

class _FragmentPageState<FragmentPage> extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody(),);
  }


  ///构建AppBar
  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
          icon: Image.asset(
            'images/rex.jpg', height: 20,),
          onPressed: () {

          }),
      title: new Text("Flutter in Fragment", style: new TextStyle(
          color: Color(0xff333333), fontWeight: FontWeight.bold, fontSize: 18),
        maxLines: 1,),
      centerTitle: true,);
  }

  _buildBody() {
    return Container(constraints: BoxConstraints(
        minWidth: double.infinity, maxHeight: double.infinity),
      child: Center(child: Text("我是嵌入Fragment中的flutter界面"),),);
  }
}
