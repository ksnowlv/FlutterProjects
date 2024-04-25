import 'package:flutter/material.dart';
    
class FavoritePage extends StatelessWidget {

  const FavoritePage({super.key,});

  @override
  Widget build(BuildContext context) {
    final Map<dynamic,dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>?;
    
    return Scaffold(
      appBar: AppBar(title: Text(arguments?['title']??'')),
      body: const Center(child: Text('')),
    );
  }
}