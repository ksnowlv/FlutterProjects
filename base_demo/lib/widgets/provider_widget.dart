import 'package:base_demo/widgets/getx_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  } 

   void decrement() {
    _counter++;
    notifyListeners();
  } 
}

class ProviderWidget extends StatefulWidget {
  const ProviderWidget({super.key});

  @override
  ProviderWidgetState createState() => ProviderWidgetState();
}

class ProviderWidgetState extends State<ProviderWidget> {
  
  
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterModel>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('counter value:${counter.counter}'), 
        ElevatedButton(onPressed: () => counter.increment(), child: const Text('+')), 
        ElevatedButton(onPressed: () => counter.decrement(), child: const Text('-')), 
      ],
    );
  }
}