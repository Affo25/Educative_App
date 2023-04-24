
import 'package:educative_app/models/response_data.dart';
import 'package:educative_app/models/user_data.dart';
import 'package:educative_app/utils/logger_util.dart';
import 'package:json_store/json_store.dart';

class DatabaseService {
  JsonStore jsonStore = JsonStore();

  //UserData get _currentUserData => _currentUserData;
  // late Admin _loggedInAdmin;

  UserData get currentUserData => _currentUserData;
  late UserData _currentUserData;


  Future<void> clearDatabase() async {
    await jsonStore.clearDataBase();
  }

  void setCurrentUserData(UserData userData) {
    _currentUserData = userData;
  }

  Future<ResponseData> loadUser() async {
    try {
      logger('loadAdmin: Fetching data');
      Map<String, dynamic>? json = await jsonStore.getItem('user_detail');

      if (json != null) {
        logger('loadAdmin: Data fetched');
        _currentUserData = UserData.fromJson(json);
        return ResponseData('OK', 'Success', _currentUserData);
      }

      return ResponseData('ERROR', 'loadAdmin: No data found', []);
    } catch (e) {
      logger('loadAdmin: ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> saveUser(UserData admin) async {
    try {
      logger('saveAdmin: Saving data');
      _currentUserData = admin;
      await jsonStore.setItem('user_detail', admin.toJson());

      return ResponseData('OK', 'Success', []);
    } catch (e) {
      logger('saveAdmin: ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }

  Future<ResponseData> removeUser() async {
    try {
      logger('removeAdmin: Removing data');
      await jsonStore.deleteItem("user_detail");

      return ResponseData('OK', 'Success', []);
    } catch (e) {
      logger('removeAdmin: ' + e.toString());
      return ResponseData('ERROR', 'Failed', e.toString());
    }
  }
  //
  // Future<ResponseData> getUsers() async {
  //   try {
  //     logger('getUsers: Fetching data');
  //     Map<String, dynamic>? json = await jsonStore.getItem('users');
  //
  //     List<UserData> userList = [];
  //     if (json != null) {
  //
  //       Map<String, dynamic> userMap = json;
  //
  //       var jsonMap = userMap['data'] as List;
  //
  //       jsonMap.forEach(
  //         (data) => {
  //           userList.add(
  //             UserData.fromJson(data),
  //           )
  //         },
  //       );
  //
  //       return ResponseData('OK', 'Success', userList);
  //     }
  //
  //     return ResponseData('ERROR', 'getUsers: No data found',userList );
  //   } catch (e) {
  //     logger('getUsers: ERROR - ' + e.toString());
  //     return ResponseData('ERROR', 'Failed', e.toString());
  //   }
  // }

   Future<bool> checkUser(UserData userData) async {
     try {
       logger('getUsers: Fetching data');
       Map<String, dynamic>? json = await jsonStore.getItem('users');

       if (json != null) {
         List<UserData> userList = [];

         Map<String, dynamic> userMap = json;

         var jsonMap = userMap['data'] as List;

         jsonMap.forEach(
           (data) => {
             userList.add(
               UserData.fromJson(data),
             )
           },
         );
        //  var found = userList
        //      .where((u) =>
        //          u.Field2 == userData.Field2 || u.Field4 == userData.Field4)
        //      .toList();
        // if (found.isNotEmpty && found.length > 0) {
        //    return true;
        //  }
         return false;
       }

       return false;
     } catch (e) {
       logger('getUsers: ERROR - ' + e.toString());
       return false;
    }
   }

  // Future<ResponseData> updateUsers(List<UserData> userList) async {
  //   try {
  //     logger('updateUsers: Updating data');
  //
  //     Map<String, dynamic> userMap = Map<String, dynamic>();
  //     userMap['data'] = userList;
  //
  //     await jsonStore.setItem('users', userMap);
  //     return ResponseData('OK', 'Success', []);
  //   } catch (e) {
  //     logger('saveUser: ERROR - ' + e.toString());
  //     return ResponseData('ERROR', 'Failed', e.toString());
  //   }
  // }
  //
  // Future<ResponseData> saveUser(UserData userData) async {
  //   try {
  //     logger('saveUser: Saving data');
  //     var json = await jsonStore.getItem('users');
  //     List<UserData> userList = [];
  //
  //     if (json != null) {
  //       Map<String, dynamic> userMap = json;
  //
  //       var jsonMap = userMap['data'] as List;
  //
  //       jsonMap.forEach((data) => {userList.add(UserData.fromJson(data))});
  //
  //       userData.ID = userList.length + 1;
  //       userList.add(userData);
  //       userMap['data'] = userList;
  //
  //       await jsonStore.setItem('users', userMap);
  //       return ResponseData('OK', 'Success', []);
  //     } else {
  //       Map<String, dynamic> userMap = Map<String, dynamic>();
  //       userData.ID = userList.length + 1;
  //       userList.add(userData);
  //       userMap['data'] = userList;
  //
  //       await jsonStore.setItem('users', userMap);
  //       return ResponseData('OK', 'Success', []);
  //     }
  //   } catch (e) {
  //     logger('saveUser: ERROR - ' + e.toString());
  //     return ResponseData('ERROR', 'Failed', e.toString());
  //   }
  // }
  //
  // Future<ResponseData> saveSlotSettings(SlotDetail slotDetail) async {
  //   try {
  //     logger('saveSlotSettings: Saving data');
  //
  //     Map<String, dynamic>? json = await jsonStore.getItem('settings');
  //     if (json != null) {
  //       Map<String, dynamic> slotMap = json;
  //       slotMap['data'] = slotDetail;
  //       await jsonStore.setItem('settings', slotMap);
  //     }
  //     else{
  //       Map<String, dynamic> slotMap = Map<String, dynamic>();
  //       slotMap['data'] = slotDetail;
  //       await jsonStore.setItem('settings', slotMap);
  //     }
  //
  //     return ResponseData('OK', 'Success', []);
  //   } catch (e) {
  //     logger('saveSlotSettings: ERROR - ' + e.toString());
  //     return ResponseData('ERROR', 'Failed', e.toString());
  //   }
  // }
  //
  // Future<ResponseData> getSlotSettings() async {
  //   try {
  //     logger('getSlotSettings: Fetching data');
  //     Map<String, dynamic>? json = await jsonStore.getItem('settings');
  //
  //     if (json != null) {
  //       List<Slot> slotList = [];
  //
  //       Map<String, dynamic> giftMap = json;
  //
  //       var jsonMap = giftMap['data'];
  //       var startTime = jsonMap['startTime'];
  //       var endTime = jsonMap['endTime'];
  //       var slots = jsonMap['slots'] as List;
  //
  //       slots.forEach(
  //         (slot) => {
  //           slotList.add(
  //             Slot.fromJson(slot),
  //           )
  //         },
  //       );
  //
  //       SlotDetail slotDetail = SlotDetail(startTime, endTime, slotList);
  //       return ResponseData('OK', 'Success', slotDetail);
  //     }
  //     else{
  //       List<Slot> _slotsList = [];
  //       SlotDetail slotDetail = SlotDetail(
  //           DateTime.now().toUtc().toString(),
  //           DateTime.now().toUtc().toString(),
  //           _slotsList);
  //       return ResponseData('OK', 'Success', slotDetail);
  //     }
  //     return ResponseData('ERROR', 'getSlotSettings: No data found', []);
  //   } catch (e) {
  //     logger('getSlotSettings: ERROR - ' + e.toString());
  //     return ResponseData('ERROR', 'Failed', e.toString());
  //   }
  // }
}
