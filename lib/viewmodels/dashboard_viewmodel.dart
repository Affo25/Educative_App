
import 'package:educative_app/services/api_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../services/database_service.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _databaseService = locator<DatabaseService>();
  final _apiService = locator<ApiService>();

  Future<void> Init() async {
    setBusy(true);
    var categoriesData = await _apiService.getCategories();
    print(categoriesData);
    setBusy(false);
  }
}
