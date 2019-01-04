import 'package:flutter/material.dart';

//间隔线
class Bottom extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 30 //最小高度为50像素
      ),
      child: Container(
          height: 20,
          child: Column(children: <Widget>[Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5), child: Text('到底了'))
          ])
      ),
    );
  }
}
