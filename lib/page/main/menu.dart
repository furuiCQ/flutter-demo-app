import 'package:flutter/material.dart';
import 'package:flutter_app/view/menuItem.dart';

class Menu extends StatelessWidget {
  onTap() {
    print("button click");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Wrap(
        spacing: 40.0, // 主轴(水平)方向间距
        runSpacing: 10.0, // 纵轴（垂直）方向间距
        children: <Widget>[
          MenuItem(images: 'assets/images/monitor_icon.png',
              title: '在线监测',
              onTap: onTap),
          MenuItem(images: 'assets/images/src_assets_image_zichan_icon.png',
              title: '资产分布',
              onTap: onTap),
          MenuItem(images: 'assets/images/standingbook_icon.png',
              title: '设备台账',
              onTap: onTap),
          MenuItem(images: 'assets/images/src_assets_image_yunwei_icon.png',
              title: '运维统计',
              onTap: onTap),
          MenuItem(images: 'assets/images/src_assets_image_hetong_icon.png',
              title: '合同签订',
              onTap: onTap),
          MenuItem(images: 'assets/images/src_assets_image_pingheng_icon.png',
              title: '购售平衡',
              onTap: onTap),
          MenuItem(images: 'assets/images/src_assets_image_piancha_icon.png',
              title: '偏差跟踪',
              onTap: onTap),
        ],
      ),
    );
  }


}
