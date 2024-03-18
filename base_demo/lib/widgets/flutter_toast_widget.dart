import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterToastWidget extends StatelessWidget {
  const FlutterToastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
            Fluttertoast.showToast(msg: 'toast demo');
          }, 
          child: const Text("show default toast")
          ),
          ElevatedButton(
            onPressed: () {
            Fluttertoast.cancel();
          }, 
          child: const Text("cancel toast")
          ),
      
        ]);
  }
}
