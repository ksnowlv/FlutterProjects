import 'package:flutter/material.dart';

class ValuekeyPage extends StatefulWidget {
  const ValuekeyPage({super.key});

  @override
  State<ValuekeyPage> createState() => _ValuekeyPageState();
}

class _ValuekeyPageState extends State<ValuekeyPage> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Dismissible(
                    key: ValueKey(item),
                    background: Container(color: Colors.red),
                    onDismissed: (direction) {
                      setState(() {
                        _removeItem(index);
                      });
                    },
                    child: ListTile(
                      title: Text(item),
                      trailing: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () => _insertItem(index+1),
                      ),
                    ),
                  );
                },
              ),
            ),
            FloatingActionButton(
              onPressed: _addItem,
              child: const Icon(Icons.add),
            ),
          ],
        ));
  }

  void _addItem() {
    setState(() {
      items.add('New Item ${items.length + 1}');
    });
  }

  void _removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void _insertItem(int index) {
    setState(() {
      items.insert(index, 'Inserted Item  ${items.length + 1}');
    });
  }
}
