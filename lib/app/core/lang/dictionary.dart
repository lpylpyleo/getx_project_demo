import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_project_demo/generated/locales.g.dart';

class Dictionary extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => AppTranslation.translations;
}
