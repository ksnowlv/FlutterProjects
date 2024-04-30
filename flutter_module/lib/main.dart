import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const methodChannel = MethodChannel('com.example.flutter_channel');

  String name = '';
  int age = 0;
  int _counter = 0;

  String messageChannelName = '';
  int messageChannelAge = 0;

  static const messageChannel = BasicMessageChannel<dynamic>(
    'com.example.flutter_channel_basic_message_channel',
    StandardMessageCodec(),
  );

  @override
  void initState() {
    super.initState();
    initMethodChannel();
    initMessageChannel();
  }

  void initMethodChannel() {
    methodChannel.setMethodCallHandler((call) async {
      debugPrint("Method call: ${call.method}");
      if (call.method == "openFlutterView") {
        if (call.arguments.length == 2) {
          name = call.arguments[0];
          age = call.arguments[1];
          setState(() {
            debugPrint("name: $name, age: $age");
          });
        }
        // Do something with the arguments if needed
      }
    });
  }

  void initMessageChannel() {
    messageChannel.setMessageHandler((message) async {
      if (message != null && message is Map) {
        messageChannelName = message['name'];
        messageChannelAge = message['age'];

          setState(() {
            debugPrint("MessageChannel name: $messageChannelName, age: $messageChannelAge");
          });
      }
      // Return an optional reply back to iOS
      return "Data received by Flutter";
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(' data {name:$name, age:$age} from iOS'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => _methodChannelCalliOS(),
                child: const Text('method channel send data to iOS')),
            const SizedBox(height: 20),
            Text(
                ' data {BasicMessageChannel receive message name:$messageChannelName, age:$messageChannelAge} from iOS'),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => _messageChannelSendMessageToiOS(),
                child: const Text('BasicMessageChannel send data to iOS'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _methodChannelCalliOS() async {
    try {
      final Map<String, dynamic> arguments = {
        'message': 'I am air from Flutter',
        'count': _counter
      };
      final String result =
          await methodChannel.invokeMethod('dataFromFlutter', arguments);

      debugPrint('send data to iOS: $result');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _messageChannelSendMessageToiOS() async {
    try {
      final Map<String, dynamic> arguments = {
        'message': 'BasicMessageChannel I am air from Flutter',
        'count': _counter
      };
      final String result = await messageChannel.send(arguments);

      debugPrint('BasicMessageChannel  send data to iOS: $result');
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    methodChannel.setMethodCallHandler(null);
    messageChannel.setMessageHandler(null);
  }
}
