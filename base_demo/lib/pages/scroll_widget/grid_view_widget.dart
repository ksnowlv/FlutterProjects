import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(Object context) {
    
    return GridView.count(crossAxisCount: 3,
    children: const [
      Icon(Icons.book), 
      Icon(Icons.camera),
      Icon(Icons.alarm),
      Icon(Icons.email),
      Icon(Icons.ac_unit), 
      Icon(Icons.accessibility), 
      Icon(Icons.attach_file) ,
      Icon(Icons.abc_sharp) ,
      Icon(Icons.abc_rounded) ,

    ],
    );
  }

}