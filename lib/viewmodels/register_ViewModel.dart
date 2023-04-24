import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:educative_app/models/response_data.dart';
import 'package:educative_app/services/database_service.dart';
import 'package:educative_app/utils/logger_util.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/user_data.dart';

class RegisterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();

  void init() async {}

  void createNewUser(String name,String email,String gender, String password, String phone) async {
    if(name=="" || email == "" || password == "")
      {
        return;
      }
    UserData d = UserData(0,name,email,password,gender,"0",phone,"");
    // d.Name = name;
    // d.Email = email;
    // d.Gender = gender;
    // d.Password = password;
    // d.PhoneNo = phone;
    Map<String,dynamic> uData = d.toJson();
    await _apiService.signupUser(uData);
  }
}
