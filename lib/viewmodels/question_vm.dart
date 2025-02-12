import 'package:educative_app/app/globals.dart';
import 'package:educative_app/extensions/extensions.dart';
import 'package:educative_app/models/Category.dart';
import 'package:educative_app/models/NewQuestion.dart';
import 'package:educative_app/models/Option.dart';
import 'package:educative_app/models/Question.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/app.router.dart';
import '../models/SubCategory.dart';
import '../models/response_data.dart';
import '../services/database_service.dart';
import 'package:educative_app/utils/logger_util.dart';
import '../models/NewQuestion.dart';

class QuestionViewModel extends BaseViewModel{
  final _navigationService = locator<NavigationService>();
  final _snackbarService = locator<SnackbarService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();
  List<String> optionList=<String>["1","2","3","4"];
  List<Category> categoryList=<Category>[];
  List<SubCategory> subList=<SubCategory>[];
  int SelectedCatID = 0;
  int SelectedSubID = 0;
  Future<void> Init() async {
    setBusy(true);
    var categoriesData = await _apiService.getCategories();
    print(categoriesData.Status);
    var result = categoriesData.Data as List;
    for (var json in result) {
      categoryList.add(Category.fromJson(json));
    }
    print(categoryList);
    setBusy(false);
  }
  void LoadSubcategories(int catId)
  {
    SelectedCatID = catId;
    var found = categoryList.firstWhere((el) => el.CatID ==catId );
    if(found!=null)
    {
      subList = found.Childs;
    }
    print(subList);
    notifyListeners();
  }
  void SetSubId(int subId)
  {
    SelectedSubID = subId;
    // globals.SubId = subId;
    // _navigationService.navigateTo(Routes.quizview);
  }
  void AddNewQuestion( String Title,String Option1,String Option2, String Option3, String Option4,int CorrectOption) async {
    if(Title=="" || Option1 == "" ||Option2==""||Option3== ""|| Option4==""||CorrectOption==0)
    {
      _snackbarService.showSnackbar(message: "Plaese enter Title or Option");
      return;
    }
    NewQuestion q = NewQuestion(0,SelectedCatID,SelectedSubID, Title, 10, globals.currentUser!.UserID);
    List<Option> options = [];
    options.add(Option(0,Option1,0,CorrectOption==1,'ACTIVE'));
    options.add(Option(0,Option2,0,CorrectOption==2,'ACTIVE'));
    options.add(Option(0,Option3,0,CorrectOption==3,'ACTIVE'));
    options.add(Option(0,Option4,0,CorrectOption==4,'ACTIVE'));

    Map<String,dynamic> uData = Map<String,dynamic>();
    uData['Options'] = options;
    uData['QuestionDetail'] = q;
    ResponseData response = await _apiService.AddQuestion(uData);

    if (response.Status == "ERROR") {
      logger("Error saving Question");
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
          title: 'Successfully Saved Question',
          duration: Duration(seconds: 5)
      );


    }

    setBusy(false);
    _navigationService.navigateTo(Routes.dashboardView);

  }
}