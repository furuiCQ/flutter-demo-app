import 'package:flutter/material.dart';
import '../http/HttpUtils.dart';
import '../http/HttpContants.dart';
import '../view/Toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isButtonDisabled = false;
  bool _isShowPass = true;
  bool _isShowClearIcon = false;
  bool _isShowPassIcon = false;
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  void initState() {
    _isButtonDisabled = false;
    _isShowPass = true;
    _nameController.addListener(() {
      setState(() {
        _isShowClearIcon = _nameController.text.isNotEmpty;
      });
      _buttonDisable();
    });
    _passController.addListener(() {
      setState(() {
        _isShowPassIcon = _passController.text.isNotEmpty;
      });
      _buttonDisable();
    });
  }

  void _clearName() {
    _nameController.clear();
  }

  void _showPass() {
    setState(() {
      _isShowPass = !_isShowPass;
    });
  }

  void _buttonDisable() {
    print(_nameController.text);
    print(_passController.text);
    setState(() {
      _isButtonDisabled =
      (_nameController.text.isNotEmpty && _passController.text.length >= 6);
    });
  }

  void _login() {
    HttpUtils.login(HttpContants.FAR_POWER_LOGIN,
        {"account": _nameController.text,
          "password": _passController.text},
            (data) {
          print(data);
          Toast.show(context, '登录成功!', time: 3000);
          Navigator.popAndPushNamed(context,

              "home");
        }, (msg) {
          Toast.show(context, msg);
        }
        , null);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/login_bg.png'))
                  ),
                )),
            Positioned(top: 80,
                width: 48,
                height: 48,
                child: Image.asset(
                    'assets/images/src_assets_image_icon_logo.png')),

            Positioned(
              top: 180,
              left: 25,
              right: 25,
              height: 60,
              child: TextField(
                autofocus: false,
                controller: _nameController,
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '请输入账号',
                  contentPadding: EdgeInsets.fromLTRB(65, 18, 0, 18),
                  labelStyle: TextStyle(
                      color: Color(0xFF999999), fontSize: 16),
                  hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 16),
                  suffixIcon: _isShowClearIcon ? IconButton(
                      icon: Icon(Icons.clear),
                      color: Color(0xffa0b8dc),
                      onPressed: _clearName) : null,

                ),
              ),
            ),
            Positioned(
              top: 198,
              left: 35,
              child: Text('账号',
                style: TextStyle(color: Color(0xFF3d4d66), fontSize: 16),),
            ),
            Positioned(
              top: 240,
              left: 25,
              right: 25,
              height: 60,
              child: TextField(
                controller: _passController,
                obscureText: _isShowPass,
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  hintText: '请输入密码',
                  contentPadding: EdgeInsets.fromLTRB(65, 18, 0, 18),
                  labelStyle: TextStyle(
                      color: Color(0xFF999999), fontSize: 16),
                  hintStyle: TextStyle(color: Color(0xFF999999), fontSize: 16),
                  suffixIcon: _isShowPassIcon ? IconButton(
                      icon: Icon(_isShowPass ? Icons.visibility_off : Icons
                          .visibility),
                      color: Color(0xffa0b8dc),
                      onPressed: _showPass) : null,
                ),
              ),
            ),
            Positioned(
              top: 258,
              left: 35,
              child: Text('密码',
                style: TextStyle(color: Color(0xFF3d4d66), fontSize: 16),),
            ),
            Positioned(
              top: 320,
              left: 25,
              right: 25,
              height: 42,
              child: RaisedButton(
                disabledColor: Color(0xffa0b8dc),
                color: Color(0xff2f81f8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0)),
                child: Text(
                  "登  录", style: TextStyle(color: Colors.white, fontSize: 16),),
                onPressed: _isButtonDisabled ? _login : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
