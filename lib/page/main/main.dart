import 'package:flutter/material.dart';
import 'banner.dart';
import 'menu.dart';
import 'package:flutter_app/view/line.dart';
import 'customAccess.dart';
import 'package:flutter_app/view/bottom.dart';
import 'package:flutter_app/view/echarts.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xfff3f4f5),
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            MainBanner(), //轮播图
            Line(height: 10.0, color: Colors.black12),
            Menu(), //菜单模块
            Line(height: 10.0, color: Colors.black12),
            CustomAccess(), //客户接入量
            Bottom(),
          ],
        ),
      ),
    );
  }
}
