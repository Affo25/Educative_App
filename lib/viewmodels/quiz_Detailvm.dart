
import 'package:educative_app/app/globals.dart';
import 'package:educative_app/views/quiz_detailview.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:educative_app/services/api_service.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../models/Quiz_Detail.dart';
import '../services/database_service.dart';


class QuizDetailViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();
  List<QuizDetail> quizDetailList = [];
  Future<void> Init() async {
    setBusy(true);
    var resultData = await _apiService.getQuizDetail(globals.ResID);
    print(resultData.Status);
    var result = resultData.Data as List;
    for (var json in result) {

      quizDetailList.add(QuizDetail.fromJson(json));

    }

    //print(resultDetailList.length);
    setBusy(false);
  }
  void gotoResultDetail(int ResID,int UserID){
    globals.ResID = ResID;
    globals.currentUser?.UserID = UserID ;
    _navigationService.navigateTo(Routes.quiz_detailview);
  }
}

