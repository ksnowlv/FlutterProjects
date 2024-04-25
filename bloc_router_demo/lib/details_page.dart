import 'package:flutter/material.dart';

// 首页模块的详情页面
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final Map<dynamic,dynamic>?arguments = ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>?;
    
    return Scaffold(
      appBar: AppBar(title: Text(arguments?['title']??'')),
      body: Center(child: Text(arguments?['content']??'')),
    );
  }
}