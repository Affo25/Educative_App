
import 'package:educative_app/models/Category.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:educative_app/app/app.locator.dart';
import 'package:educative_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/globals.dart';
import '../models/SubCategory.dart';
import '../services/database_service.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();
  List<Category> categoryList=<Category>[];
  List<SubCategory> subList=<SubCategory>[];

  Future<void> Init() async {
    setBusy(true);
    var categoriesData = await _apiService.getCategories();
    print(categoriesData.Status);
    var result = categoriesData.Data;
    for (var json in result) {
      categoryList.add(Category.fromJson(json));
    }
    print(categoryList);
    setBusy(false);
  }
  String catType = "main";



  void gotoSubCategory(int catId)
  {

    globals.CatId = catId;
    catType = "sub";
    var found = categoryList.firstWhere((el) => el.CatID ==catId );
    if(found!=null)
      {
        subList = found.Childs;
      }
  if(subList.length>0)
    {
      print(subList);
    }
    notifyListeners();
  }
 void showMain(){
   catType = "main";
   notifyListeners();
 }
  void gotoQuestions(int subId,String Name)
  {
    globals.SubName = Name;
    globals.SubId = subId;
    _navigationService.navigateTo(Routes.dialogview);
  }
  void gotodashboard()
  {
    _navigationService.navigateTo(Routes.dashboardView);
  }
}


