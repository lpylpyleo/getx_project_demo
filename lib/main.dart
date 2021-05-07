import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_project_demo/app/core/lang/dictionary.dart';
import 'package:getx_project_demo/app/core/theme/color_theme.dart';
import 'package:logging/logging.dart';

import 'app/middlewares/http_client.dart';
import 'app/routes/app_pages.dart';

void main() {
  _setupLogging();
  AppHttpClient.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Project Demo",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        backgroundColor: ColorTheme.backgroundColor,
      ),
      translations: Dictionary(),
      locale: Dictionary.locale,
      fallbackLocale: Dictionary.fallbackLocale,
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    Get.log('${rec.level.name}: ${rec.message}');
    // print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
