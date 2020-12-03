import 'dart:io';

import 'package:day_by_day_counter/model/project_config.model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'controller/project_config_ctrl.dart';
import 'pages/my_list/my_list.page.dart';
import 'pages/splash/Splash.screen.dart';
import 'package:admob_flutter/admob_flutter.dart';

Future<void> main() async {
  await DotEnv().load('.env');

  final ProjectConfigCtrl _projectConfigCtrl = Get.put(ProjectConfigCtrl());
  _projectConfigCtrl.projectConfigModel = new ProjectConfigModel(
      "dev", DotEnv().env['ADMOB_DEV'], DotEnv().env['ADMOB_DEV']);

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ko', 'KR')],
        path: 'assets/translations', // <-- change patch to your
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );

  Admob.initialize();
  await Admob.requestTrackingAuthorization();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Day By Day Counter',

      debugShowCheckedModeBanner: false,
      supportedLocales: [const Locale("en"), const Locale("ko")],
      locale: context.locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate
      ],
      // supportedLocales: [
      //   const Locale('ko', 'KR'),
      //   const Locale('en', 'US'),
      //   // include country code too
      // ],
      home: SplashScreen(1500),
    );
  }
}
