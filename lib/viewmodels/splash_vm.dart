
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:educative_app/models/response_data.dart';
import 'package:educative_app/services/database_service.dart';
import 'package:educative_app/utils/logger_util.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/globals.dart';


class SplashVModel extends BaseViewModel
{
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();

  void init() async {
    ResponseData response = await _databaseService.loadUser();

    if (response.Status == "OK") {
      Future.delayed(const Duration(seconds: 5), () {
        logger("Admin logged in already");
        globals.currentUser = _databaseService.currentUserData;
        _navigationService.navigateTo(Routes.fullappview);
      });
    } else {
      Future.delayed(const Duration(seconds: 20), () {
        logger("Admin not logged in");
        _navigationService.pushNamedAndRemoveUntil(Routes.loginView);
      });
    }
  }
}