import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rayo_taxi/app_lifecycle_handler.dart';
import 'package:rayo_taxi/common/app/splash_screen.dart';
import 'package:rayo_taxi/common/routes/router.dart';
import 'package:rayo_taxi/common/settings/routes_names.dart';
import 'package:rayo_taxi/common/theme/app_theme.dart';
import 'package:rayo_taxi/main.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

RemoteMessage? initialMessage;



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    

    return 
    AppLifecycleHandler(
      child: GetMaterialApp(

      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      locale: const Locale('es', 'ES'),
      supportedLocales: [
        const Locale('es', 'ES'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
             theme: AppThemeCustom() .getTheme(mode: ThemeMode.light, context: context),
      onGenerateRoute: RouterApp.generateRoute,

    )
    );
  }
}