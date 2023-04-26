// import 'package:flutter_spinthewheel/services/api_service.dart';
// import 'package:flutter_spinthewheel/services/database_service.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:educative_app/services/database_service.dart';
import 'package:educative_app/views/login_view.dart';
import 'package:educative_app/views/register_view.dart';
import 'package:educative_app/views/dashboard_view.dart';
import 'package:educative_app/views/splash.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:educative_app/views/register_view.dart';

@StackedApp(
  routes: [
     MaterialRoute(page: SplashView, initial: true),
     MaterialRoute(page: RegisterView),
     MaterialRoute(page: LoginView),
    MaterialRoute(page: LoginView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: DatabaseService),
     LazySingleton(classType: ApiService),
  ],
)
class AppSetup {}
