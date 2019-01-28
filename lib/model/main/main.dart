import 'package:flutter_app/http/httpUtils.dart';
import 'package:flutter_app/http/httpContants.dart';

class MainModel {
  Map options;

  MainModel({this.options});
}

MainModel appReducer(MainModel state, action) {
  return MainModel(options: state.options);
}

