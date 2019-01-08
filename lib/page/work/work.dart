import 'package:flutter/material.dart';
import 'package:flutter_app/view/echarts.dart';

class WorkPage extends StatelessWidget {

  var options = {
    "xAxis": {
      "type": 'category',
      "data": ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    "yAxis": {
      "type": 'value'
    },
    "series": [{
      "data": [820, 932, 901, 934, 1290, 1330, 1320],
      "type": 'line'
    }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xfff3f4f5),
        body: EchartView(height: 280, data: options),
      ),

    );
  }
}
