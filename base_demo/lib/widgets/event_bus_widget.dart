import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

class CounterEvent {
  int count;

  CounterEvent(this.count);
}

class EventBusWidget extends StatefulWidget {
  const EventBusWidget({super.key});

  @override
  EventBusWidgetState createState() => EventBusWidgetState();
}

class EventBusWidgetState extends State<EventBusWidget> {
  int _counter = 0;
  final eventBus = EventBus();

  @override
  void initState() {
    super.initState();
    eventBus.on<CounterEvent>().listen((event) {
      setState(() {
        _counter = event.count;
      });
    });
  }

  @override
  void dispose() {
    eventBus.destroy();
    super.dispose();
  }

  void _incrementCounter() {
    _counter++;
    eventBus.fire(CounterEvent(_counter));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('the counter value is'),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
            onPressed: () {
              _incrementCounter();
            },
            child: const Text('增加计数counter'))
      ],
    );
  }
}
