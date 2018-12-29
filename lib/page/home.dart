import 'package:flutter/material.dart';
import 'main/main.dart';
import 'mine/mine.dart';
import 'msg/msg.dart';
import 'work/work.dart';

class HomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _lastPressedAt; //上次点击时间
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '工作', '消息', '我的'];

  /*
   * 根据image路径获取图片
   * 这个图片的路径需要在 pubspec.yaml 中去定义
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  /*
   * 根据索引获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _tabIndex) {
      return new Text(appBarTitles[curIndex],
          textAlign: TextAlign.end,
          style: new TextStyle(color: const Color(0xff3F87F5)));
    } else {
      return new Text(appBarTitles[curIndex],
          textAlign: TextAlign.end,
          style: new TextStyle(color: const Color(0xffd9cece)));
    }
  }

  /*
   * 存储的四个页面，和Fragment一样
   */
  var _bodys;

  void initData() {
    /*
      bottom的按压图片
     */
    tabImages = [
      [
        getTabImage('assets/images/home_icon.png'),
        getTabImage('assets/images/home_icon_blue.png')
      ],
      [
        getTabImage('assets/images/work_icon.png'),
        getTabImage('assets/images/work_icon_blue.png')
      ],
      [
        getTabImage('assets/images/message_icon.png'),
        getTabImage('assets/images/message_icon_blue.png')
      ],
      [
        getTabImage('assets/images/oneself_icon.png'),
        getTabImage('assets/images/oneself_icon_blue.png')
      ]
    ];

    _bodys = [
      new MainPage(),
      new WorkPage(),
      new MsgPage(),
      new MinePage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: _bodys[_tabIndex],
        bottomNavigationBar: new BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0), title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1), title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2), title: getTabTitle(2)),
            new BottomNavigationBarItem(
                icon: getTabIcon(3), title: getTabTitle(3)),
          ],
          //设置显示的模式
          type: BottomNavigationBarType.fixed,
          //设置当前的索引
          currentIndex: _tabIndex,
          //tabBottom的点击监听
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
      ),
    );
  }
}