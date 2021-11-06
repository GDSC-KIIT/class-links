import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/theme.dart';

void main() {
  runApp(
    Builder(builder: (context) {
      return GetMaterialApp(
        title: "Application",
        theme: ThemeClass.buildTheme(context),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
    }),
  );
}
