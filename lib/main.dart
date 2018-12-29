import 'package:flutter/material.dart';
import 'package:flutter_app/page/home.dart';
import 'page/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        hintColor: Color(0xffa0b8dc), //定义下划线颜色
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => HomePage(), //首页
      },
      home: LoginPage(title: 'Flutter Demo Home Page 1'),
    );
  }
}

