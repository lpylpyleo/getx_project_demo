import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_project_demo/app/core/lang/dictionary.dart';
import 'package:getx_project_demo/app/core/theme/color_theme.dart';

import 'app/middlewares/http_client.dart';
import 'app/routes/app_pages.dart';

void main() {
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
