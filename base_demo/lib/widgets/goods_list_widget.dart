import 'package:flutter/material.dart';

class GoodsListWidget extends StatelessWidget {
  const GoodsListWidget({super.key} 
  );

  void _onListItemPressed(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('You tapped on item $index'),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 100,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.start_sharp),
          title: Text(' item $index'),
          subtitle: Text(' This ia item with index $index'),
          onTap: () {
            _onListItemPressed(context, index);
          },
        );
      },
    );
  }
}
