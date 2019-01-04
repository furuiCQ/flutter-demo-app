import 'package:flutter/material.dart';

//数据标签
class Tag extends StatelessWidget {
  Tag({this.title, this.value, this.unit});

  final String title;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                //上下各添加8像素补白
                padding: EdgeInsets
                    .fromLTRB(4, 0, 0, 0
                ),
                child: Text(this.title, textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff73787f)
                    )),
              ),
              Padding(padding: EdgeInsets
                  .fromLTRB(0, 4, 0, 10
              ),
                  child: Row(children: <Widget>[
                    Padding(
                      //上下各添加8像素补白
                      padding: const EdgeInsets.symmetric(vertical: 4.0
                      ),
                      child: Text(this.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xff2f81f8)
                          )),
                    ),
                    Padding(
                      //上下各添加8像素补白
                      padding: EdgeInsets
                          .fromLTRB(4, 10, 0, 0
                      ),
                      child: Text(this.unit,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 8,
                              color: Color(0xff73787f)
                          )
                      )
                      ,
                    )
                    ,
                  ]))
            ])
    );
  }
}
