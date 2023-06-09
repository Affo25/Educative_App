
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:educative_app/utils/logger_util.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/response_data.dart';
import '../models/user_data.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _apiService = locator<ApiService>();
  final _databaseService = locator<DatabaseService>();
  bool _showPass=false;
  bool get ShowPass => _showPass;

  Future<void> login(username, password) async {
    if(username==""|| password==""){
       _snackbarService.showSnackbar(message: "Plaese enter username or password");
       return;
    }
    setBusy(true);
    ResponseData response = await _apiService.loginAdmin(username, password);

    if (response.Status == "ERROR") {
      logger("Error logging in admin");
      _snackbarService.showSnackbar(
        message: response.Message,
        title: 'Something went wrong',
        duration: Duration(seconds: 2),
      );
      setBusy(false);
      return;
    }

    UserData admin = UserData.fromJson(response.Data[0]);

    response = await _databaseService.saveUser(admin);

    if (response.Status == "ERROR") {
      logger("Error saving admin");
      _snackbarService.showSnackbar(
        message: response.Message,
        title: 'Something went wrong',
        duration: Duration(seconds: 2),
      );
      setBusy(false);
      return;
    }

    setBusy(false);
    _navigationService.navigateTo(Routes.dashboardView);
  }

  void showMessage(String message) {
    _snackbarService.showSnackbar(
      message: "Please enter your " + message,
      title: 'Incomplete fields',
      duration: Duration(seconds: 2),
    );
  }
  void toggelPassword() async{
    _showPass = !_showPass;
    print(ShowPass);
    notifyListeners();
  }
}
