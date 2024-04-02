import 'package:base_demo/pages/mine/user/page_route/user_page_route.dart';
import 'package:base_demo/widgets/event_bus_widget.dart';
import 'package:flutter/material.dart';

class StateSharedWidget extends StatefulWidget {
  const StateSharedWidget({super.key});

  @override
  State<StateSharedWidget> createState() => _StateSharedWidgetState();
}

class _StateSharedWidgetState extends State<StateSharedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('---使用Event Bus进行通信---'),
        const SizedBox(height: 10,),
        const EventBusWidget(),
        const SizedBox(height: 20,),
        const Text('---使用Provider进行通信---'),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: ()  {
            _showUserPageRoute(context);
          },
          child: const Text('使用Provider进行通信'),
        ),
      ],
    );
  }

  void _showUserPageRoute(BuildContext context) async {
    if (!context.mounted) {
      return;
    }

    final result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const UserPageRoute();
    }));

    debugPrint('result: $result');
  }
}
