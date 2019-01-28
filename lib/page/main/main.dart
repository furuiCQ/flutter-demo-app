import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';


import 'package:flutter_app/http/httpUtils.dart';
import 'package:flutter_app/http/httpContants.dart';
import 'package:flutter_app/view/toast.dart';
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
    super.initState();
    getData();
  }

  getData() async {
    await HttpUtils.get(
        HttpContants.FAR_POWER_HOME_CUSTOMERACCESS, (result) {
      var zl = [];
      var cl = [];
      var hj = [];
      var xAxis = [];
      var datas=result["datas"];
      var data=result["data"];
      for (var bean in datas) {
        if (bean["title"] == "存量") {
          for (var mp in bean["dataList"]) {
            zl.add(mp["value"]);
          }
        }
        if (bean["title"] == "增量") {
          for (var mp in bean["dataList"]) {
            cl.add(mp["value"]);
          }
        }
        if (bean["title"] == "合计") {
          for (var mp in bean["dataList"]) {
            xAxis.add(mp["time"]);
            hj.add(mp["value"]);
          }
        }
      }



      var ops = {
        "color": ["#3f87f5", "#FFAB1C", "#8A2BE2"],
        "dataZoom": [{
          "filterMode": "none",
          "type": "inside",
          "xAxisIndex": 0
        }
        ],
        "grid": {
          "containLabel": true,
          "bottom": "3%",
          "left": "3%",
          "right": "4%"
        },
        "legend": {
          "data": ["存量", "增量"],
          "right": 0
        },
        "series": [{
          "barWidth": 23,
          "name": "存量",
          "stack": "合计",
          "type": "bar",
          "data": cl
        }, {
          "barWidth": 23,
          "name": "增量",
          "stack": "合计",
          "type": "bar",
          "data": zl
        }, {
          "lineStyle": {
            "emphasis": {
              "opacity": 0.0
            },
            "normal": {
              "opacity": 0.0
            }
          },
          "itemStyle": {
            "emphasis": {
              "opacity": 0.0
            },
            "normal": {
              "opacity": 0.0
            }
          },
          "name": "合计",
          "type": "line",
          "data": ["16"]
        }
        ],
        "tooltip": {
          "confine": true,
          "trigger": "axis"
        },
        "xAxis": [{
          "axisLabel": {
            "fontSize": 10,
            "interval": 0
          },
          "axisLine": {
            "lineStyle": {
              "color": ["#bdbdbd"]
            }
          },
          "type": "category",
          "data": xAxis
        }
        ],
        "yAxis": [{
          "nameTextStyle": {
            "align": "left",
            "fontSize": 10.0,
            "padding": [0, 30, 0, 0]
          },
          "axisLabel": {
            "fontSize": 10
          },
          "axisLine": {
            "lineStyle": {
              "color": ["#bdbdbd"],
              "width": 0
            }
          },
          "name": "户",
          "type": "value"
        }
        ]
      };
      setState(() {
        options = ops;

        if(data["allNumb"]!=null){
          allCustom=data["allNumb"].toString();
        }
        if(data["allElect"]!=null){
          allNumb=data["allElect"].toString();
        }
        if(data["newNumb"]!=null){
          newNumb=data["newNumb"].toString();
        }

      });
    }, (msg) {
      Toast.show(context, msg);
    },null);
  }


  var options = {};
  String allCustom = '--';
  String allNumb = '--';
  String newNumb = '--';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
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
            CustomAccess(options,allCustom,allNumb,newNumb), //客户接入量
            Bottom(),
          ],
        ),
      ),
    );
  }
}

