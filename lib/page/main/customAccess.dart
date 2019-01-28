import 'package:flutter/material.dart';
import 'package:flutter_app/view/tip.dart';
import 'package:flutter_app/view/tag.dart';
import 'package:flutter_app/view/line.dart';
import 'package:flutter_echart/flutter_echart.dart';

class CustomAccess extends StatelessWidget {
  CustomAccess(this.data, this.allCustom, this.allNumb, this.newNumb);

  final Map data;
  String allCustom;

  String allNumb;

  String newNumb;


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
                          Tag(title: '服务总户数', value: allCustom, unit: '户'),
                          Tag(title: '接入总容量', value: allNumb, unit: 'kVA'),
                          Tag(title: '当月新签客户', value: newNumb, unit: '户')
                        ])),
                Line(height: 1.0, color: Colors.black12),
                EchartView(height: 250, data: data),
              ],
            ),
          ),
        ));
  }
}
