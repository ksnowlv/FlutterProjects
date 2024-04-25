import 'package:bloc_router_demo/router_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RouterCubit, RouterInfo>(
      listener: (context, state) {
        if (state.route != null) {
          Navigator.of(context)
              .pushNamed(state.route!, arguments: state.params);
        }
      },
      builder: (context, state) {
        return _buildHomePage(context);
      },
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<RouterCubit>().navigateTo('/details', {'title': '详情', 'content': '我是详情页'});
                },
                child: const Text('跳转详情'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<RouterCubit>().navigateTo('/view', {'title': '查看', 'content': '我是查看页'});
                  },
                  child: const Text('跳转查看')),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<RouterCubit>().navigateTo('/favorite', {
                      'title': '收藏',
                    });
                  },
                  child: const Text('跳转收藏')),
            ],
          ),
        ));
  }
}
