import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_demo/pages/mine/user_model/model/user_model.dart';

class UserViewModel with ChangeNotifier {
  final UserModel _userModel;

  UserModel get userModel => _userModel;

  UserViewModel() : _userModel = UserModel('', 0);

  // ignore: empty_constructor_bodies
  void updateName(String newName) {
    _userModel.name = newName;
    notifyListeners();
  }

  void updateAge(int newAge) {
    _userModel.age = newAge;
    notifyListeners();
  }
}

//观察UserViewModel数据变化
final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) => UserViewModel());
