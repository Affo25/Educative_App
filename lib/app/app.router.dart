// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:educative_app/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../views/login_view.dart';
import '../views/register_view.dart';
import '../views/dashboard_view.dart';
import '../views/full_app.dart';
// import '../views/data_view.dart';
// import '../views/last_view.dart';
// import '/views/login_view.dart';
// import '../views/settings_view.dart';
// import '../views/start_view.dart';
// import '../views/sync_view.dart';
// import '../views/wheel_view.dart';

class Routes {
   static const String splashView = '/';
   static const String registerView = '/Register-view';
   static const String loginView = '/login-view';
   static const String dashboardView = '/dashboard-view';
   // static const String syncView = '/sync-view';
  // static const String settingsView = '/settings-view';
  // static const String dataView = '/data-view';
  // static const String wheelView = '/wheel-view';
  // static const String lastView = '/last-view';
  static const all = <String>{
    splashView,
    registerView,
     loginView,
     dashboardView,
    // syncView,
    // settingsView,
    // dataView,
    // wheelView,
    // lastView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
     RouteDef(Routes.splashView, page: SplashView),
     RouteDef(Routes.registerView, page: RegisterView),
     RouteDef(Routes.loginView, page: LoginView),
     RouteDef(Routes.dashboardView, page: DashboardScreen),
    // RouteDef(Routes.syncView, page: SyncView),
    // RouteDef(Routes.settingsView, page: SettingsView),
    // RouteDef(Routes.dataView, page: DataView),
    // RouteDef(Routes.wheelView, page: WheelView),
    // RouteDef(Routes.lastView, page: LastView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginView(),
        settings: data,
      );
    },
    RegisterView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RegisterView(),
        settings: data,
      );

    },
    DashboardScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashboardScreen(),
        settings: data,
      );

    }
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LastView arguments holder class
// class LastViewArguments {
//   final Gift gift;
//   LastViewArguments({required this.gift});
// }
