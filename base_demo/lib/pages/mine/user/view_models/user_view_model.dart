import 'package:base_demo/pages/mine/user/model/user.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {

  User? _user;
  User? get user => _user;

  void loadUser() {
    _user = User('ksnowlv', 10);
    notifyListeners();
  }

  void increaseUserAge() {
    _user?.age++;
    // 通知视图(user interface)更新
    notifyListeners();
  }

   void decreaseUserAge() {
    _user?.age--;
    // 通知视图(user interface)更新
    notifyListeners();
  }

  void updateUserName(String name) {
    _user?.name = name;
    // 通知视图(user interface)更新
    notifyListeners();
  }
}