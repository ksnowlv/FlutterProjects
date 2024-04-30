import 'package:base_demo/pages/mine/user_model/view_models/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserModelPage extends ConsumerWidget {
  const UserModelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userViewModel = ref.watch(userViewModelProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('viewModel:${userViewModel}'),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                //ref.read(userViewModelProvider).updateName('kk');
                ref.read(userViewModelProvider.notifier).updateName('kksnow');
              },
              child: const Text('更新姓名')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                //ref.read(userViewModelProvider).updateAge(userViewModel.userModel.age + 1);
                //userViewModel.updateAge(1+ userViewModel.userModel.age);
                ref.read(userViewModelProvider.notifier).updateAge(userViewModel.age + 1);
              },
              child: const Text('更新年龄')),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
