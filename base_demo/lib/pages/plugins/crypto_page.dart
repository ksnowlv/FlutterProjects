import 'package:flutter/material.dart';
    
class CryptoPage extends StatefulWidget {
  final String title;

  const CryptoPage({super.key, required this.title});

  @override
  State<CryptoPage>  createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(),
    );
  }
}