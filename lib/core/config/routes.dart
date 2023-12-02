import 'package:e_commerce_app_c9_mon/core/config/page_route_names.dart';
import 'package:e_commerce_app_c9_mon/features/login/pages/login_view.dart';
import 'package:e_commerce_app_c9_mon/features/splash/pages/splash_view.dart';
import 'package:flutter/material.dart';

import '../../features/home/pages/layout_view.dart';
import '../../features/register/pages/register_view.dart';

class Routes {
  static Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRouteNames.initial:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);

      case PageRouteNames.login:
        return MaterialPageRoute(
            builder: (context) => LoginView(), settings: settings);
      case PageRouteNames.register:
        return MaterialPageRoute(
            builder: (context) => RegisterView(), settings: settings);

      case PageRouteNames.home:
        return MaterialPageRoute(
            builder: (context) => LayoutView(), settings: settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
    }
  }
}
