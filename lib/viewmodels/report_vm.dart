import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:educative_app/models/response_data.dart';
import 'package:educative_app/services/database_service.dart';
import 'package:educative_app/utils/logger_util.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/globals.dart';
import '../models/Feedback.dart';
class ReportViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();
  List<String> reporttypeList=<String>["Duplicate Question","Wrong Question","Wrong Answer","Others"];

 int UserID = 0;

  void init() async {}
  void SendFeedback(String Title) async {

    if(Title=="")
    {
      _snackbarService.showSnackbar(message: "Plaese enter Title");
      return;
    }
    UserID = globals.currentUser!.UserID;
     feedback feed = feedback(0, UserID,Title);
    Map<String,dynamic> uData = feed.toJson();
    ResponseData response = await _apiService.AddFeedback(uData);

    if (response.Status == "ERROR") {
      logger("Error sending Feedback");
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
          title: 'Successfully Send Feedback',
          duration: Duration(seconds: 5)
      );
    }

    setBusy(false);
    _navigationService.navigateTo(Routes.dashboardView);

  }
  void SendReport(String Title,String ReportType) async {

    if(Title=="")
    {
      _snackbarService.showSnackbar(message: "Plaese enter Title");
      return;
    }
    UserID = globals.currentUser!.UserID;
    Report rep = Report(0, UserID,Title,ReportType);
    Map<String,dynamic> uData = rep.toJson();
    ResponseData response = await _apiService.AddReport(uData);

    if (response.Status == "ERROR") {
      logger("Error sending Report");
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
          title: 'Successfully Send Report',
          duration: Duration(seconds: 5)
      );
    }

    setBusy(false);
    _navigationService.navigateTo(Routes.dashboardView);

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
