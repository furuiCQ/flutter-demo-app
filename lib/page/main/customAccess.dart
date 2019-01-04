import 'package:flutter/material.dart';
import 'package:flutter_app/view/tip.dart';
import 'package:flutter_app/view/tag.dart';
import 'package:flutter_app/view/line.dart';
import 'package:flutter_app/view/echarts.dart';

class CustomAccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tip(title: '客户接入量',
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: double.infinity, //宽度尽可能大
              minHeight: 300.0 //最小高度为50像素
          ),
          child: Container(
            child: Column(
              children: <Widget>[
                Line(height: 1.0, color: Colors.black12),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Tag(title: '服务总户数', value: '15000', unit: '户'),
                          Tag(title: '接入总容量', value: '1000', unit: 'kVA'),
                          Tag(title: '当月新签客户', value: '18', unit: '户')
                        ])),
                Line(height: 1.0, color: Colors.black12),
                //Echarts(),
              ],
            ),
          ),
        ));
  }
}
