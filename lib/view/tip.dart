import 'package:flutter/material.dart';

//小标题
class Tip extends StatelessWidget {
  Tip({this.title, this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity, //宽度尽可能大
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(16, 13, 16, 13),
                child: Row(
                  children: <Widget>[
                    ConstrainedBox(
                        constraints: BoxConstraints(
                            minWidth: 4, //宽度尽可能大
                            minHeight: 13 //最小高度为50像素
                        ),
                        child: Container(
                            width: 4,
                            height: 13,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.0), //3像素圆角
                                  color: Color(0xFF2f81f8)),
                            )
                        )),
                    Padding(
                      //上下各添加8像素补白
                        padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                        child:
                        Text(this.title,
                            style: TextStyle(
                                color: Color(0xFF3d4d66), fontSize: 14)))
                  ]
                  ,
                )),
            child
          ]
          ,
        )
        ,
      )
      ,
    );
  }
}
