
import 'package:educative_app/app/globals.dart';
import 'package:educative_app/models/resultdetail.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:educative_app/services/api_service.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../models/Result.dart';
import '../services/database_service.dart';



class ResultDetailViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();

  int total = 0;
  int get Total => total;
  int wrong = 0;
  int get Wrong => wrong;
  int skipped = 0;
  int get Skipped => skipped;
  int correct = 0;
  int get Correct => correct;

  Future<void> Init() async {
    setBusy(true);
    var resultData = await _apiService.getUserResultDetail(globals.currentUser!.UserID, globals.ResID);
    print("result detail => " +resultData.Status);
    Map<String,dynamic> data = resultData.Data as Map<String,dynamic>;
    total = int.parse(data['total'].toString());
    wrong = int.parse(data['wrong'].toString());
    correct = int.parse(data['correct'].toString());
    skipped = int.parse(data['skipped'].toString());
    print(total);
    print(skipped);
    setBusy(false);
  }

}

