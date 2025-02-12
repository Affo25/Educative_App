import 'package:educative_app/extensions/extensions.dart';
import 'package:educative_app/models/Category.dart';
import 'package:educative_app/models/user_data.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/globals.dart';
import '../models/SubCategory.dart';
import '../models/response_data.dart';
import '../services/database_service.dart';
import '../utils/logger_util.dart';


class ProfileViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _snackbarService = locator<SnackbarService>();
  final _apiService = locator<ApiService>();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final newpasswordCtrl = TextEditingController();
  final phoneNoCtrl = TextEditingController();
   UserData? _currentUser;
  UserData? get  currentUser => _currentUser;
   int ID =0;

  Future<void> Init ()async {
   //_currentUser=  globals.currentUser!;

   nameCtrl.text = _currentUser?.Name ?? "";
   emailCtrl.text = _currentUser?.Email ?? "";
   passwordCtrl.text = _currentUser?.Password ?? "";
   phoneNoCtrl.text = _currentUser?.PhoneNo ?? "";
  }

  void Updateuser() async {
    if(nameCtrl.text=="" || emailCtrl == "" ||passwordCtrl==""|| phoneNoCtrl=="")
    {
      _snackbarService.showSnackbar(message: "Plaese enter username or password");
      return;
    }
    int userID = globals.currentUser!.UserID;
    UserData d = UserData(userID,nameCtrl.text,emailCtrl.text,passwordCtrl.text,"",0,phoneNoCtrl.text,"5:14 20/06/2023");
    Map<String,dynamic> uData = d.toJson();
    ResponseData response = await _apiService.updateUser(uData);

    if (response.Status == "ERROR") {
      logger("Error Updating User");
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
          title: 'Successfully updated User',
          duration: Duration(seconds: 5)
      );
    }

    setBusy(false);
    _navigationService.navigateTo(Routes.acc_settingview);

  }
}