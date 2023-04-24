import 'package:dio/dio.dart';
import 'package:educative_app/models/response_data.dart';
import 'package:educative_app/utils/logger_util.dart';

class ApiService {
  Dio dio = Dio();
  String baseUrl = "http://localhost:59948/service";

  Future<ResponseData> loginAdmin(String email, String password) async {
    try {
      Response response = await dio.post(
        baseUrl + '/user/login',
        data: {
          'Email': email,
          'Password': password,
        },
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('loginUser: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('loginUser: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('loginUser: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }

  Future<ResponseData> signupUser(Map<String, dynamic> userData) async {
    try {
      Response response = await dio.post(
        baseUrl + '/user/register',
        data: userData,
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('signupUser: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('signupUser: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('signupUser: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }

  // Future<ResponseData> uploadData(List<UserData> userList) async {
  //   try {
  //     Response response = await dio.post(
  //       baseUrl + '/act-data/save-data',
  //       data: userList,
  //     );
  //
  //     var status = response.data['Status'];
  //
  //     if (status == "ERROR") {
  //       logger('uploadData: ERROR');
  //       return ResponseData('ERROR', response.data['Message'], []);
  //     }
  //
  //     logger('uploadData: OK');
  //     return ResponseData('OK', 'Success', response.data['Data']);
  //   } on DioError catch (e) {
  //     logger('uploadData: ERROR - ' + e.toString());
  //     return ResponseData('ERROR', 'Failed', e.message);
  //   }
  // }
}
