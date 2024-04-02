import 'package:flutter/material.dart';

class SharedDataWidget extends InheritedWidget {
  final String data;

  const SharedDataWidget(this.data, {super.key, required super.child});

  static SharedDataWidget of(BuildContext context) {
    // return context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
    final element =
        context.getElementForInheritedWidgetOfExactType<SharedDataWidget>()!;
    return element.widget as SharedDataWidget;
  }

  @override
  bool updateShouldNotify(SharedDataWidget oldWidget) {
    debugPrint('SharedDataWidget data: $data, old data: ${oldWidget.data}');
    return data != oldWidget.data;
  }
}

class InheritedDemoWidget extends StatelessWidget {
  const InheritedDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sharedDataWidget =
        context.dependOnInheritedWidgetOfExactType<SharedDataWidget>();
    final data = sharedDataWidget?.data;

    debugPrint('InheritedDemoWidget data:$data');
    return Text('data:$data');
  }
}

class MyInheritedWidgetProvider extends StatefulWidget {
  final Widget child;

  const MyInheritedWidgetProvider({super.key, required this.child});

  static MyInheritedWidgetProviderState of(BuildContext context) {
    return context.findAncestorStateOfType<MyInheritedWidgetProviderState>()!;
  }

  @override
  MyInheritedWidgetProviderState createState() =>
      MyInheritedWidgetProviderState();
}

class MyInheritedWidgetProviderState extends State<MyInheritedWidgetProvider> {
  String data = 'hello';
  int count = 0;

  void updateData(String newData) {
    setState(() {
      ++count;
      data = 'newData $count';
      debugPrint('MyInheritedWidgetProvider updateData data:$data');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SharedDataWidget(data, child: widget.child);
  }
}

class InheritedContainerWidget extends StatelessWidget {
  const InheritedContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidgetProvider(child: Builder(
      builder: (context) {
        return Column(
          children: [
            const InheritedDemoWidget(),
            ElevatedButton(
                onPressed: () {
                  MyInheritedWidgetProvider.of(context)
                      .updateData('I am a new data');
                },
                child: const Text('更新SharedDataWidget中的数据')),
          ],
        );
      },
    ));
  }
}
