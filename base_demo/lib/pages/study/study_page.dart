import 'package:base_demo/pages/layout/box_constraints_demo_widget.dart';
import 'package:flutter/material.dart';
    
class StudyPage extends StatefulWidget {
  final String title;
  const StudyPage({super.key, required this.title});

  @override
   State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const BoxConstraintsDemoWidget(),
    );
  }
}