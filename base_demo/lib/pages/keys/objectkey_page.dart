import 'package:flutter/material.dart';

class ObjectkeyPage extends StatefulWidget {
  const ObjectkeyPage({super.key});

  @override
  State<ObjectkeyPage> createState() => _ObjectkeyPageState();
}

class _ObjectkeyPageState extends State<ObjectkeyPage> {
  List<ObjectItem> objectItemList = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 100; i++) {
      objectItemList.add(ObjectItem(id: i, name: 'list Item $i'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView.builder(
        itemCount: objectItemList.length,
        itemBuilder: (context, index) {
          final object = objectItemList[index];
          debugPrint('build ListTile $index');
          return Card(
            key: ObjectKey(object), // 使用对象的属性作为ObjectKey
            child: ListTile(
              title: Text(object.name),
              trailing:IconButton(
               icon:const Icon(Icons.edit),
               onPressed:() {
                 _updateObject(index);
               },
             ),
            ),
          );
        },
      ),
    );
  }

  void _updateObject(int index) {

    setState(() {
      objectItemList[index] = ObjectItem(id: index, name: 'updated Item $index');
    });
  }
}

class ObjectItem {
  final int id;
  final String name;

  ObjectItem({required this.id, required this.name});
}
