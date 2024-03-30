import 'package:base_demo/pages/mine/user/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('mvvm'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              ElevatedButton(onPressed: () {
                var userViewModel = Provider.of<UserViewModel>(context, listen: false);
                userViewModel.loadUser();
              }, child: const Text('加载用户数据'), 
              ),

              Consumer<UserViewModel>(builder: (context, userViewModel, child) {

                return userViewModel.user != null ? 
                Column(
                  children: [
                    Text('name: ${userViewModel.user?.name}, age: ${userViewModel.user?.age}'),

                    const SizedBox(height: 20,), 
                    ElevatedButton(
                      onPressed: () => userViewModel.increaseUserAge(), 
                    child: const Text('年龄增加1岁')
                    ),
                       const SizedBox(height: 20,), 
                    ElevatedButton(onPressed: () => userViewModel.decreaseUserAge(), 
                    child: const Text('年龄减小1岁')
                    ),
                  ],
                  
                 ): const Text('用户数据为空，没有加载成功');
                
              },),
            ]
            ),
      ),
    );
  }
}
