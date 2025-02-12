
import 'package:educative_app/app/globals.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:educative_app/services/api_service.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../models/Result.dart';
import '../services/database_service.dart';



class ResultViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();
  List<Result> resultDetailList=<Result>[];
  Future<void> Init() async {
    setBusy(true);
    var resultData = await _apiService.getUserResults(globals.currentUser!.UserID);
    print(resultData.Status);
    var result = resultData.Data as List;
    for (var json in result) {
      resultDetailList.add(Result.fromJson(json));

    }

    print(resultDetailList.length);
    setBusy(false);
  }
  void gotodashboard()
  {
    _navigationService.navigateTo(Routes.dashboardView);
  }
  void gotoResultDetail(int ResID,int UserID){
    globals.ResID = ResID;
     globals.currentUser?.UserID = UserID ;
    _navigationService.navigateTo(Routes.quiz_detailview);
  }
}

