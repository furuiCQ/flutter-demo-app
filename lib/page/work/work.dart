import 'package:flutter/material.dart';
import 'package:flutter_app/page/main/banner.dart';
import 'package:flutter_app/page/main/menu.dart';
import 'package:flutter_app/view/line.dart';
import 'package:flutter_app/page/main/customAccess.dart';
import 'package:flutter_app/view/bottom.dart';
import 'package:flutter_app/view/echarts.dart';

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
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
            Container(height: 300, child: Stack(
                alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                children: <Widget>[
                  Positioned(
                    top:100.0,
                    child: Container(width: 300, height: 300, child: Echarts()),
                  ),

                ]))
          ],
        ),
      ),
      //home: Scaffold(
      //  backgroundColor: Color(0xfff3f4f5),
      // body: Container(height: 300, child: Echarts())),
    );
  }
}
