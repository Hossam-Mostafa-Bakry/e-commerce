import 'package:bot_toast/bot_toast.dart';
import 'package:e_commerce_app_c9_mon/core/config/page_route_names.dart';
import 'package:e_commerce_app_c9_mon/core/config/routes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/config/application_theme.dart';
import 'core/serivces/loading_service.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {


  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      theme: ApplicationThemeManager.appTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      navigatorKey: navigatorKey,
      initialRoute: PageRouteNames.initial,
      onGenerateRoute: Routes.onGeneratedRoute,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}

