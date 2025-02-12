import 'package:dio/dio.dart';
import 'package:educative_app/models/response_data.dart';
import 'package:educative_app/utils/logger_util.dart';
class ApiService {
  Dio dio = Dio();
  String baseUrl = "https://stream.iboothme.pk/service/remote";

  Future<ResponseData> loginAdmin(String email, String password) async {
    try {
      Response response = await dio.post(
        '$baseUrl/login-user',
        data: {
          'Email': email,
          'Password': password,
        },
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('loginAdmin: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('loginAdmin: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('loginAdmin: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }

  Future<ResponseData> signupUser(Map<String, dynamic> userData) async {
    try {
      Response response = await dio.post(
        '$baseUrl/add-new-user', // we have to create new api
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
  Future<ResponseData> AddFeedback(Map<String, dynamic> Feedback) async {
    try {
      Response response = await dio.post(
        '$baseUrl/add-new-feedback', // we have to create new api
        data: Feedback,
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('AddFeedback: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('AddFeedback: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('AddFeedback: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }
  Future<ResponseData> AddReport(Map<String, dynamic> Report) async {
    try {
      Response response = await dio.post(
        '$baseUrl/add-new-report', // we have to create new api
        data: Report,
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('AddReport: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('AddReport: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('AddReport: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }
   // add new question api
  Future<ResponseData> AddQuestion(Map<String, dynamic> NewQuestion) async {
    try {
      Response response = await dio.post(
        '$baseUrl/save-new-question', // we have to create new api
        data: NewQuestion,
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('AddQuestion: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('AddQuestion: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('AddQuestion: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }

  Future<ResponseData> getCategories() async {
    try {
      Response response = await dio.post(
        '$baseUrl/categories'
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('getCategories: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('getCategories: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('getCategories: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }
  Future<ResponseData> getQuizDetail(int resID) async {
    try {
      Response response = await dio.post(
          '$baseUrl/user-quiz-detail',
        data : {
            'ResID': resID
        }
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('getQuizDetail: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('getQuizDetail: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('getQuizDetail: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }
  Future<ResponseData> getQuestions(int catId, int subId) async {
    try {
      Response response = await dio.post(
          '$baseUrl/questions',
        data: {
          'CatID': catId,
          'SubID': subId,
        },
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('getQuestions: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('getQuestions: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('getCategories: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }

  Future<ResponseData> getUserResults(int userID) async {
    try {
      Response response = await dio.post(
          '$baseUrl/user-results',
        data: {
          'UserID': userID
        },
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('getUserResults: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('getUserResults: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('getUserResults: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }
  Future<ResponseData> getUserResultDetail(int userID,int resID) async {
    try {
      Response response = await dio.post(
        '$baseUrl/user-result-detail',
        data: {
          'UserID': userID,
          'ResID': resID
        },
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('getUserResults: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('getUserResults: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('getUserResults: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }

  Future<ResponseData> updateUser( Map<String, dynamic> userData) async {
    try {
      Response response = await dio.post(
        '$baseUrl/update-user',
        data: userData,

      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('getUserResults: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('getUserResults: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('getUserResults: ERROR - $e');
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }
  Future<ResponseData> uploadData(Map<String,dynamic> data) async {
    try {
      Response response = await dio.post(
        baseUrl + '/save-user-answers',
        data: data,
      );

      var status = response.data['Status'];

      if (status == "ERROR") {
        logger('uploadData: ERROR');
        return ResponseData('ERROR', response.data['Message'], []);
      }

      logger('uploadData: OK');
      return ResponseData('OK', 'Success', response.data['Data']);
    } on DioError catch (e) {
      logger('uploadData: ERROR - ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.message);
    }
  }
}
