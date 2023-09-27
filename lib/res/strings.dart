import 'string_en.dart';
import 'string_zh.dart';

///获取资源
const Map<String, Map<String, String>> localizedSimpleValues = {
  //简体中文
  'zh_CN': languageChinese,
  //英文
  'en_US': languageEnglish,
};

class Ids {
  static const String appName = 'app_name';
  static const String save = 'save';
  static const String more = 'more';
  static const String confirm = 'confirm';
  static const String ok = 'ok';
  static const String cancel = 'cancel';
  static const String delete = 'delete';
  static const String tabHome = 'tabHome';
  static const String IKnow = 'IKnow';
}
