// import 'package:flutter_spinthewheel/services/api_service.dart';
// import 'package:flutter_spinthewheel/services/database_service.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:educative_app/services/database_service.dart';
import 'package:educative_app/views/login_view.dart';
import 'package:educative_app/views/register_view.dart';
import 'package:educative_app/views/full_app.dart';
import 'package:educative_app/views/splash.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../views/aboutapp_view.dart';
import '../views/account_settingview.dart';
import '../views/feedback_view.dart';
import '../views/popup_view.dart';
import '../views/quiz_detailview.dart';
import '../views/reportquestion_view.dart';
import '../views/resultcountview.dart';
import '../views/result_view.dart';
import '../views/subcategory.dart';
import '../views/helpview.dart';

@StackedApp(
  routes: [
     MaterialRoute(page: SplashView, initial: true),
     MaterialRoute(page: RegisterView),
     MaterialRoute(page: LoginView),
    MaterialRoute(page: SubCatScreen),
    MaterialRoute(page: FullAppScreen),
    MaterialRoute(page: SelectDialog),
    MaterialRoute(page: ResultScreen),
    MaterialRoute(page: ResultDetailScreen),
    MaterialRoute(page: FeedbackScreen),
    MaterialRoute(page: ReportQuestionScreen),
    MaterialRoute(page: AccountSettingScreen),
    MaterialRoute(page: QuizDetailScreen),
    MaterialRoute(page: AboutAppScreen),
    MaterialRoute(page: HelpScreen)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DatabaseService),
     LazySingleton(classType: ApiService),
  ],
)
class AppSetup {}
