import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flutter/utils/HttpController.dart';

class LoginPath extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final phoneController = TextEditingController();
    final psdController = TextEditingController();

    return new Scaffold(
        appBar: PreferredSize(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.transparent])),
            ),
            preferredSize: Size(double.infinity, 60)),
        body: new Padding(
          padding: new EdgeInsets.all(24.0),
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 30), //内边距，里边的蓝块，需要给宽高
                    child: new Text(
                      '个人登录',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    )),
                new Container(
                  decoration: new BoxDecoration(
                    border: new Border.all(
                        color: Color(0xFFe1e1e1), width: 0.5), // 边色与边宽度
                    color: Color(0xFFFFFFFF), // 底色
                    borderRadius: new BorderRadius.circular((0.5)),
                  ),
                  padding: new EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: new Row(
                    children: <Widget>[
                      new Text('+86 >',
                          style: new TextStyle(
                            color: Color(0xff4A4F5C),
                          )),
                      new SizedBox(
                        width: 10,
                      ),
                      new Expanded(
                          child: new TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: '请输入手机号',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color(0xffC5C5C5)),
                        ),
                      )),
                    ],
                  ),
                ),
                new Container(
                    decoration: new BoxDecoration(
                      border: new Border.all(
                          color: Color(0xFFe1e1e1), width: 0.5), // 边色与边宽度
                      color: Color(0xFFFFFFFF), // 底色
                      borderRadius: new BorderRadius.circular((0.5)),
                    ),
                    padding: new EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: new TextField(
                      controller: psdController,
                      decoration: const InputDecoration(
                        hintText: '请输入密码',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Color(0xffC5C5C5)),
                      ),
                    )),
                new Container(
                  margin: new EdgeInsets.fromLTRB(0, 50, 0, 0),
                  width: double.maxFinite,
                  child: MaterialButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    padding: new EdgeInsets.fromLTRB(0, 12, 0, 12),
                    child: new Text('登录'),
                    onPressed: () {
                      getData(
                          context, phoneController.text, psdController.text);
                      print('submit ');
                    },
                  ),
                )
              ]),
        ));
  }

  void getData(BuildContext context, String phone, String psd) {
    Map<String, String> header = new Map();
    header["deviceId"] = "823b323f-19f9-49ae-96f1-f1cf12058584";
    header["toonType"] = "162";
    Map<String, String> params = new Map();
    params["countryCode"] = "0086";
    params["mobile"] = phone;
    params["pwd"] = psd;
    HttpController.postWithHeader(
        "http://taccount.zhengtoon.com/toonuser/account/loginByPwd", (data) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(data),
          );
        },
      );
    }, header: header, params: params);
  }
}
