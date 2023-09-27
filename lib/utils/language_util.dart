import 'package:awesome_base/awesome_base.dart';

class LanguageUtil extends BaseLanguageUtil {
  static final LanguageUtil instance = LanguageUtil();

  ///填写支持的语言
  @override
  List<Language> getLanguages() => [
        Language('Ids.languageEN', 'en', 'US'), //英语
        Language('Ids.languageZH', 'zh', 'CN'), //中文
      ];
}
