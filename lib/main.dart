import 'package:awesome_base/awesome_base.dart';
import 'package:example/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ume/flutter_ume.dart';
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart';
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart';
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart';
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart';

import 'provider_setup.dart';
import 'res/colors.dart';
import 'res/translation_service.dart';
import 'utils/language_util.dart';

void main() {
  Global.init(
    () async {
      if (BaseConfig.debug) {
        PluginManager.instance // Register plugin kits
          ..register(Performance())
          ..register(ShowCode())
          ..register(MemoryInfoPage())
          ..register(CpuInfoPage())
          ..register(DeviceInfoPanel())
          ..register(Console());
        runApp(UMEWidget(child: MyApp(), enable: true));
      } else {
        runApp(MyApp());
      }
    },
    banRootAccess: false,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return App(
      initialRoute: Routes.initial,
      getPages: Routes.pages,
      locale: LanguageUtil.instance.getCurrentLanguage().toLocale(),
      translations: TranslationService(),
      fallbackLocale: TranslationService.fallbackLocale,
      themeBuilder: (themeColor) => ThemeUtil.copyTheme(themeColor, appBarColor: Colours.appBarMain, isDarkMode: true),
      providers: providers,
    );
  }
}
