import 'package:flutter/material.dart';

class XSingleChildScrollView extends StatelessWidget {
  const XSingleChildScrollView({super.key});

  @override
  Widget build(Object context) {
   
   return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 50,
            color: Colors.red,
            child: const Center(child: Text('item one'),),
          ),

          Container(
            height: 50,
            color: Colors.blue,
            child: const Center(child:  Text('item two'),),
          ),

          Container(
            height: 60,
            color: Colors.green,
            child: const Center(child: Text('item three'),),
          ),

          Container(
            height: 60,
            color: Colors.purple,
            child: const Center(child: Text('item four'),),
          ),
          
          Container(
            height: 60,
            color: Colors.orange,
            child: const Center(child: Text('item five'),),
          ),
        ],
      ),
    );
  }

}