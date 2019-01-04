import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';

//Echarts
class EchartView extends StatelessWidget {
  EchartView({Key key, this.data}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Echarts(),
    );
  }
}

class Echarts extends StatefulWidget {
  @override
  _EchartsState createState() => _EchartsState();
}

class _EchartsState extends State<Echarts> {
  // TextEditingController controller = TextEditingController();
  // FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var options = {
    'xAxis': {
      'type': 'category',
      'data': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    'yAxis': {
      'type': 'value'
    },
    'series': [{
      'data': [820, 932, 901, 934, 1290, 1330, 1320],
      'type': 'line'
    }
    ]
  };
  WebController webController;

  @override
  void initState() {
//    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
//      print('onStateChanged');
//      if (wvs.type == WebViewState.finishLoad) {
//        var data = json.encode(options).toString();
//        flutterWebviewPlugin.evalJavascript(
//            'javascript:test(' + data + ')')
//            .then((String result) {
//          print(result);
//        });
//      }
//    });
  }

  void onWebCreated(webController) {
    this.webController = webController;
    this.webController.loadData(
        '<html><head><title>echarts</title><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta name="viewport"          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1"><style type="text/css">      html,body {        height: 100%;        width: 100%;        margin: 0;        padding: 0;      }      #main {        height: 100%;      }      .loading-container {        display: flex;        width: 100%;        height: 100%;        align-items: center;        justify-content: center;      }      .loading {        width: 32px;        height: 32px;        animation: spin 800ms infinite linear;      }      @keyframes spin {        0%   { transform: rotate(360deg); }        100% { transform: rotate(0deg); }      }</style><script src="https://cdn.bootcss.com/echarts/4.1.0/echarts.min.js"></script><script src="http://cloud.farpower.com/console/static/echarts-extensions/echarts-liquidfill.min.js"></script></head><body><div id="main"></div><script>function test(value){    if(value!=undefined){        var myChart = echarts.init(document.getElementById("main"));myChart.setOption(value);}}</script><body><html>');
    this.webController.onPageStarted.listen((url) =>
        print("Loading $url")
    );
    this.webController.onPageFinished.listen((url) =>
        print("Finished loading $url")
    );
  }

  @override
  Widget build(BuildContext context) {
    //return Text('123');
    return FlutterNativeWeb(
        onWebCreated: onWebCreated);
//    return  WebviewScaffold(
//      //url: "http://192.168.21.10/heartrate/test.html",
//      url: new Uri.dataFromString(
//          '<html><head><title>echarts</title><meta http-equiv="content-type" content="text/html; charset=utf-8"><meta name="viewport"          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1"><style type="text/css">      html,body {        height: 100%;        width: 100%;        margin: 0;        padding: 0;      }      #main {        height: 100%;      }      .loading-container {        display: flex;        width: 100%;        height: 100%;        align-items: center;        justify-content: center;      }      .loading {        width: 32px;        height: 32px;        animation: spin 800ms infinite linear;      }      @keyframes spin {        0%   { transform: rotate(360deg); }        100% { transform: rotate(0deg); }      }</style><script src="https://cdn.bootcss.com/echarts/4.1.0/echarts.min.js"></script><script src="http://cloud.farpower.com/console/static/echarts-extensions/echarts-liquidfill.min.js"></script></head><body><div id="main"></div><script>function test(value){    if(value!=undefined){        var myChart = echarts.init(document.getElementById("main"));myChart.setOption(value);}}</script><body><html>',
//          mimeType: 'text/html').toString(),
//      withLocalUrl: true,
//      withZoom: false,
//      withJavascript: true,
//      appCacheEnabled: true,
//      withLocalStorage: true,
//      clearCache: false,
//      scrollBar: false,
//    );
  }
}
