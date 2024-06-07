import 'package:flutter/material.dart';
    
class UniqueKeyPage extends StatefulWidget {
  const UniqueKeyPage({super.key});

  @override
  State<UniqueKeyPage> createState() => _UniqueKeyPageState();
}

class _UniqueKeyPageState extends State<UniqueKeyPage> {

  var  _uniqueKey = UniqueKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(child:  Column(
        children: [
          const Text('使用 UniqueKey 更新的 Widget'), 
          const SizedBox(height: 30,), 
          ElevatedButton(
            onPressed: () {
              setState(() {
                  _uniqueKey = UniqueKey();
              });
            
            }, 
            child: const Text('更新 Widget')),

            const SizedBox(height: 30,),  

            UniqueKeyDemoWidget(key: _uniqueKey),
        ],
      ),
    ));
  }
}

class UniqueKeyDemoWidget extends StatelessWidget {
  const UniqueKeyDemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('UniqueKeyDemoWidget build');
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
      child: const Center(
        child: Text('UniqueKey 示例 Widget'),
      ),
    );
  }
}

//在 Flutter 中，UniqueKey 用于标识 Widget 的唯一性，它的主要作用是在动态添加、移除 Widget 时，确保每个 Widget 都有一个唯一的标识。这在构建一些需要动态更新布局的场景中特别有用，比如列表项的增删操作，并且也可以帮助避免一些因为 Widget 重复使用而导致的问题。
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// Future<void> fetchData() async {
//   final response = await http.get(Uri.parse('https://example.com/data'));

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     final data = jsonDecode(response.body);
//     debugPrint('Fetched data: $data');
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load data');
//   }
// }

