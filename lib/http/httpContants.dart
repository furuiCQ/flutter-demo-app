class HttpContants {
  static String TEST_HOST = "http://192.168.80.50:7000/api/";

  //**以下为接口地址*//
  static String FAR_POWER_LOGIN = "$TEST_HOST/platform/login"; //登录接口
  static String FAR_POWER_USER_MENU = "$TEST_HOST/platform/userResource/query"; //登录菜单获取
  static String FAR_POWER_REFRESH_TOKEN = "$TEST_HOST/platform/refresh_token"; //登录接口
  static String FAR_POWER_USER_INFO = "$TEST_HOST/platform/personal/data"; //我的信息查询接口
  static String FAR_POWER_UPDATE_PASSWORD = "$TEST_HOST/platform/account/updatePassword"; //修改密码接口

  static String  FAR_POWER_HOME_CUSTOMERACCESS = "$TEST_HOST/muztagata/app/main/customerAccess";//客户接入量




}