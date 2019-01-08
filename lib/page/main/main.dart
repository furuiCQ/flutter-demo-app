import 'package:flutter/material.dart';
import 'package:flutter_app/view/bottom.dart';
import 'package:flutter_app/view/line.dart';

import 'banner.dart';
import 'customAccess.dart';
import 'menu.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  var options={
    "xAxis": {
      "type": 'category',
      "data": ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    "yAxis": {
      "type": 'value'
    },
    "series": [{
      "data": [820, 932, 901, 934, 1290, 1330, 1320],
      "type": 'line'
    }]
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.white
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
            CustomAccess(options), //客户接入量
            Bottom(),
          ],
        ),
      ),
    );
  }
}

