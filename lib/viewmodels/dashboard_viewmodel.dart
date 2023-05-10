
import 'package:educative_app/models/Category.dart';
import 'package:educative_app/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../services/database_service.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();
  List<Category> categoryList=<Category>[];


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
}


