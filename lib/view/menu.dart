import 'package:flutter/material.dart';

//菜单按钮
class MenuItem extends StatelessWidget {
  MenuItem({this.images, this.title, this.onTap});

  final String images;
  final String title;

  //点击回调
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
          onTap: this.onTap,
          child: Column(
            children: <Widget>[
              Padding(
                //上下各添加8像素补白
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Image(
                  image: AssetImage(this.images),
                  width: 30,
                  height: 30,
                ),
              ),
              Padding(
                //上下各添加8像素补白
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(this.title, textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        color: Color(0xff3d4d66)
                    )),
              ),
              Padding(
                //上下各添加8像素补白
                padding: const EdgeInsets.symmetric(vertical: 4.0),
              ),
            ],
          ),
        )
    );
  }
}
