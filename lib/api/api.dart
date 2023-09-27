import 'package:awesome_base/awesome_base.dart';

import 'common_service.dart';

class API {
  API._();
  ///内网
  static const String hostRc = 'http://api1.baidu.com';

  ///外网测试
  static const String hostTest = 'https://testapi.baidu.com';

  ///线上环境
  static const String host = 'https://api.baidu.com';

  static final common = CommonService(_host);

  static String _host = host;
  static bool encrypt = true;

  static String get domain => _host;

  static Future<void> init() async {
    if (BaseConfig.debug) {
      _host = SpUtil.getString(BaseConfig.host) ?? hostRc;
      if (_host.isEmpty) {
        _host = hostRc;
      }
      encrypt = (SpUtil.getBool(BaseConfig.isEncrypt, defValue: false))!;
    } else {
      _host = host;
      encrypt = true;
    }
  }

  static Future switchHost(String newHost) async {
    _host = newHost;
    SpUtil.putString(BaseConfig.host, _host);
  }

  static Future switchIsEncrypt(bool isEncrypt) async {
    encrypt = isEncrypt;
    SpUtil.putBool(BaseConfig.isEncrypt, isEncrypt);
    return null;
  }
}
