import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HttpUtils {
  static const bool inProduction = const bool.fromEnvironment(
      "dart.vm.product");

  static Future get() async {

  }

  static Future login(url, param, callBack, failCallBack, errorCallBack) async {
    Dio dio = new Dio();
    dio.options = new Options();
    dio.options.method = 'POST';
    dio.options.contentType =
        ContentType.parse("application/json; charset=utf-8");
    if (!inProduction) {
      print(url);
      print(param);
    }
    try {
      Response response = await dio.post(url, data: param);
      if (response.statusCode != 200) {
        failCallBack(response.data['message']);
      } else {
        if (!inProduction) {
          print(response);
        }
        callBack(response.data['data']);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response.data['data']['token']);
      }
    } catch (e) {
      if (errorCallBack != null) {
        errorCallBack(e);
      }
    }
  }

  static Future post(url, param, callBack) async {
    Dio dio = new Dio();
    dio.options = new Options();
    dio.options.method = 'POST';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dio.options.headers['Authorization'] = prefs.getString('token');
    dio.options.contentType =
        ContentType.parse("application/json; charset=utf-8");
    if (!inProduction) {
      print(url);
      print(param);
      print(dio.options.headers);
    }
    try {
      Response response = await dio.post(url, data: param);
      if (response.statusCode != 200) {
        callBack.onFail(response.data['message']);
      } else {
        if (!inProduction) {
          print(response);
        }
        callBack.onSuccess(response.data['data']);
      }
    } catch (e) {
      if (callBack != null) {
        callBack.onError(e);
      }
    }
  }

  static Future getFile() async {

  }

  static Future postFile() async {

  }
}