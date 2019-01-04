import 'package:flutter/material.dart';

//间隔线
class Line extends StatelessWidget {
  Line({this.height, this.color});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: height //最小高度为50像素
      ),
      child: Container(
          height: height,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          )
      ),
    );
  }
}
