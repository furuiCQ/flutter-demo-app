import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_native_web/flutter_native_web.dart';
import 'package:flutter/services.dart';
//Echarts
class EchartView extends StatelessWidget {
  EchartView({Key key, this.height, this.data, this.child}) : super(key: key);
  final Map data;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: Colors.white,
      child: Echarts(data: data, child: child),
    );
  }
}

class Echarts extends StatefulWidget {
  Echarts({this.data, this.child});

  final Widget child;

  final Map data;

  @override
  _EchartsState createState() => _EchartsState();
}

class _EchartsState extends State<Echarts> {

  WebController webController;

  bool finished = false;

  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future onWebCreated(webController) async {
    this.webController = webController;
    String data = await getFileData("assets/echart.html");
    print(data);
    this.webController.loadData(data);
    this.webController.onPageStarted.listen((url) =>
        print("Loading $url")
    );
    this.webController.onPageFinished.listen((url) {
      print("Finished loading $url");
      var data = json.encode(widget.data).toString();
      this.webController.evalJs(
          'javascript:test(' + data + ')');
      setState(() {
        finished = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    finished = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          widget.child ??
              const Center(child: const CircularProgressIndicator()),
          AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: finished ? 1.0 : 0.0,
              child: FlutterNativeWeb(
                  onWebCreated: onWebCreated))
        ]);
  }
}
