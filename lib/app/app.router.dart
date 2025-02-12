// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:educative_app/views/Quiz.dart';
import 'package:educative_app/views/aboutapp_view.dart';
import 'package:educative_app/views/splash.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../views/New_Question.dart';
import '../views/account_settingview.dart';
import '../views/feedback_view.dart';
import '../views/helpview.dart';
import '../views/login_view.dart';
import '../views/popup_view.dart';
import '../views/quiz_detailview.dart';
import '../views/register_view.dart';
import '../views/dashboard_view.dart';
import '../views/full_app.dart';
import '../views/reportquestion_view.dart';
import '../views/resultcountview.dart';
import '../views/result_view.dart';
import '../views/subcategory.dart';
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
   static const String subcatview = '/subcat-view';
   static const String fullappview = '/fullapp-view';
   static const String quesview = '/ques-view';
   static const String quizview = '/quiz-view';
   static const String dialogview = '/dialog-view';
   static const String resultdetailview = '/result-detail-view';
   static const String resultview = '/result-view';
   static const String feedbackview = '/feedback-view';
   static const String reportquestionview = '/reportquestion-view';
   static const String acc_settingview = '/acc_setting-view';
   static const String quiz_detailview = '/quiz_detail-view';
   static const String about_appview = '/about_app-view';
   static const String helpview = '/help-view';
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
     subcatview,
     fullappview,
    quesview,
    quizview,
    dialogview,
    resultview,
    resultdetailview,
    feedbackview,
    reportquestionview,
    acc_settingview,
    quiz_detailview,
    about_appview,
    helpview,
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
    RouteDef(Routes.subcatview, page: SubCatScreen),
    RouteDef(Routes.fullappview, page: FullAppScreen),
    RouteDef(Routes.quesview, page: Questionscreen),
    RouteDef(Routes.quizview, page: QuizQuestionScreen),
    RouteDef(Routes.dialogview, page: SelectDialog),
    RouteDef(Routes.resultview, page: ResultScreen),
    RouteDef(Routes.resultdetailview, page: ResultDetailScreen),
    RouteDef(Routes.feedbackview, page: FeedbackScreen),
    RouteDef(Routes.reportquestionview, page: ReportQuestionScreen),
    RouteDef(Routes.acc_settingview, page: AccountSettingScreen),
    RouteDef(Routes.quiz_detailview, page: QuizDetailScreen),
    RouteDef(Routes.about_appview, page: AboutAppScreen),
    RouteDef(Routes.helpview, page: HelpScreen)
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

    },
    SubCatScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SubCatScreen(),
        settings: data,
      );

    },

    FullAppScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FullAppScreen(),
        settings: data,
      );

    },
    Questionscreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Questionscreen(),
        settings: data,
      );

    },
    QuizQuestionScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => QuizQuestionScreen(),
        settings: data,
      );

    },
    SelectDialog: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectDialog(),
        settings: data,
      );

    },
    ResultDetailScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResultDetailScreen(),
        settings: data,
      );

    },
    ResultScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ResultScreen(),
        settings: data,
      );

    },
    FeedbackScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FeedbackScreen(),
        settings: data,
      );

    },
    ReportQuestionScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ReportQuestionScreen(),
        settings: data,
      );

    },
    AccountSettingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AccountSettingScreen(),
        settings: data,
      );

    },
    QuizDetailScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => QuizDetailScreen(),
        settings: data,
      );

    },
    AboutAppScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutAppScreen(),
        settings: data,
      );

    },
    HelpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HelpScreen(),
        settings: data,
      );

    },
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
