import 'package:base_demo/pages/mine/user/view/user_page.dart';
import 'package:base_demo/pages/mine/user/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
    
class UserPageRoute extends StatelessWidget {

  const UserPageRoute({ super.key });
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: const UserPage(),
      );
  }
}