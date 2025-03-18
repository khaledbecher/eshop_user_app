import 'package:eshop/common/utils/services/remote/user_service.dart';
import 'package:eshop/models/userr.dart';
import 'package:flutter/cupertino.dart';
class UserNotifier with ChangeNotifier{
  Userr _user = Userr();
  bool _editLoading = false;

  Userr get user => _user;
  bool get editLoading =>_editLoading;
  Future<void> loadUser()async{
    final userr =await UserService.getUser();
    _user = Userr.fromJson(userr);
  }
  Future<void> clearUser()async{
    _user = Userr();
  }
  Future<void> editProfileInfo(String fieldName, String fieldValue)async{
    _editLoading = true;
    notifyListeners();
    await UserService.editProfileInfo(fieldName, fieldValue);
    await loadUser();
    _editLoading = false;
    notifyListeners();
  }
}