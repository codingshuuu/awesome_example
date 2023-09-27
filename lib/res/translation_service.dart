import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'strings.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  //默认语音
  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => localizedSimpleValues;
}
