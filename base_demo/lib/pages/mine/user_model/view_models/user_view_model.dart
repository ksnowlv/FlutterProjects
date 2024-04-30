import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:base_demo/pages/mine/user_model/model/user_model.dart';

// class UserViewModel with ChangeNotifier {
//   final UserModel _userModel;

//   UserModel get userModel => _userModel;

//   UserViewModel() : _userModel = UserModel('', 0);

//   // ignore: empty_constructor_bodies
//   void updateName(String newName) {
//     _userModel.name = newName;
//     notifyListeners();
//   }

//   void updateAge(int newAge) {
//     _userModel.age = newAge;
//     notifyListeners();
//   }
// }

// //观察UserViewModel数据变化
 //final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) => UserViewModel());


class UserViewModel extends Notifier<UserModel> {
  
  // ignore: empty_constructor_bodies
  void updateName(String newName) {
    state = state.copyWith(name:newName);
  }

  void updateAge(int newAge) {
    state = state.copyWith(age:newAge);   
  }
  
  @override
  UserModel build() {
    return UserModel('', 0);
  }
}

final userViewModelProvider = NotifierProvider<UserViewModel,UserModel>( UserViewModel.new);
final userViewModelP = StateProvider<UserViewModel>((ref) => UserViewModel());
//final userViewModelP1 = StateNotifierProvider<UserViewModel, UserModel>((ref) => UserViewModel());

//ChangeNotifierProvider