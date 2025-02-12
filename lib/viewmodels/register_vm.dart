import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:educative_app/extensions/extensions.dart';
import 'package:educative_app/models/response_data.dart';
import 'package:educative_app/services/database_service.dart';
import 'package:educative_app/utils/logger_util.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:educative_app/views/login_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/user_data.dart';
import '../views/login_view.dart';
import '../views/login_view.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();

  void init() async {}

  void createNewUser(String name,String email,String gender, String password, String phone,String Age) async {
    if(name=="" || email == "" ||password==""||gender== ""|| phone==""||Age=="")
      {
        _snackbarService.showSnackbar(message: "Plaese enter username or password");
        return;
      }
    UserData d = UserData(0,name,email,password,gender,Age.toInt(),phone,"");
    Map<String,dynamic> uData = d.toJson();
     ResponseData response = await _apiService.signupUser(uData);

    if (response.Status == "ERROR") {
      logger("Error saving User");
      _snackbarService.showSnackbar(
        message: response.Message,
        title: 'Something went wrong',
        duration: Duration(seconds: 2),
      );
      setBusy(false);
      return;
    }
    else
    {
      _snackbarService.showSnackbar(
          message: response.Message,
        title: 'Successfully Saved User',
        duration: Duration(seconds: 5)
      );
    }

    setBusy(false);
    _navigationService.navigateTo(Routes.loginView);

  }
  void gotologin (){
    _navigationService.navigateTo(Routes.loginView);

  }
  void showMessage(String message) {
    _snackbarService.showSnackbar(
      message: "Please enter your " + message,
      title: 'Incomplete fields',
      duration: Duration(seconds: 2),
    );
  }
}
