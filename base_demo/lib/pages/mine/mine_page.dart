import 'package:base_demo/bloc/counter_cubit.dart';
import 'package:base_demo/pages/mine/stateful_builder_page.dart';
import 'package:base_demo/pages/mine/task/controller/task_controller.dart';
import 'package:base_demo/pages/mine/user/page_route/user_page_route.dart';
import 'package:base_demo/pages/mine/value_listenable_builder_page.dart';
import 'package:base_demo/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MinePage extends StatefulWidget {
  final String title;

  const MinePage({super.key, required this.title});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () => _onShowNewMVC(context),
              child: const Text('new mvc')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => _onShowMVVM(context), child: const Text('mvvm')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => _onShowStatefulBuilderPage(context),
              child: const Text('StatefulBuilder局部刷新')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => _onShowValueListenableBuilderPage(context),
              child: const Text('ValueListenableBuilder局部刷新')),
        ],
      ),
    ));
    return const Center(
        // child: RowColumnWidget()
        //child: FlexWidget(),
        // child: SharedPreferencesWidget(),
        //child: WrapFlowWidget() ,
        //child: StackPositionedWidget(),
        // child: AlignWidegt(),
        //child: FlutterToastWidget(),
        //child: ImageCacheWidget(),
        //child: PhotoViewWidget(),
        // child: ImagePickerWidget(),
        // child:GetxWidget(),
        //child:AnimationsWidget(),
        //child: FlutteSecureStorageWidget() ,
        //child: HiveWidget(),
        //child: ProviderWidget(),
        //child: ComputeWidget(),
        // child: IsolateWidget(),
        // child: FutureWidget(),

        );

    return BlocProvider(
      create: (context) => CounterCubit(0),
      child: const Center(child: CounterWidget()),
    );
  }

  void _onShowNewMVC(BuildContext context) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const TaskController()));
    debugPrint('result:$result');
  }

  void _onShowMVVM(BuildContext context) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const UserPageRoute()));
    debugPrint('result:$result');
  }

  void _onShowStatefulBuilderPage(BuildContext context) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const StatefulBuilderPage()));
    debugPrint('result:$result');
  }

    void _onShowValueListenableBuilderPage(BuildContext context) async {
    if (!context.mounted) {
      return;
    }

    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ValueListenableBuilderPage()));
    debugPrint('result:$result');
  }
}
