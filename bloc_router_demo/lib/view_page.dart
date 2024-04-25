import 'package:flutter/material.dart';
    

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, });

  @override
  Widget build(BuildContext context) {
    final Map<dynamic,dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>?;
    
    return Scaffold(
      appBar: AppBar(title: Text(arguments?['title']??'')),
      body: Center(child: Text(arguments?['content']??'')),
    );
  }
}