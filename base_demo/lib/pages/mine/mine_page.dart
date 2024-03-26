import 'package:base_demo/bloc/counter_cubit.dart';
import 'package:base_demo/widgets/counter_widget.dart';
import 'package:base_demo/widgets/future_widget.dart';
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
  Widget build(BuildContext context) {
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
      child: FutureWidget(),
    );

    return BlocProvider(
      create: (context) => CounterCubit(0),
      child: const Center(child: CounterWidget()),
    );
  }
}