import 'dart:io';

import 'package:base_demo/common/file_mgr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class FilePage extends StatefulWidget {
  final String title;
  const FilePage({super.key, required this.title});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20,), 
              FutureBuilder(
                  future: _readTxt(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error:${snapshot.error}');
                    } else if (snapshot.hasData) {
                      return Text('txt文件内容:${snapshot.data}');
                    }
                    return const Text('txt文件内容:正在加载');
                  }),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _writeTxt();
                  },
                  child: const Text('write from txt')),
            ],
          ),
        ));
  }

  Future<String> _readTxt() async {
    try {
      String txtContent = await rootBundle.loadString('assets/txt/test.txt');
      debugPrint('txtContent:$txtContent');
      return txtContent;
    } catch (e) {
      debugPrint('_writeTxt:$e');
      return '';
    }
  }

  Future<void> _writeTxt() async {
    try {
      const String data = 'Hello,World! /n测试';
      final directory = await FileMgr.instance.getTemporaryDirectoryPath();
      debugPrint('directory:$directory');
      final file = File('$directory/test.txt');
      await file.writeAsString(data);
    } catch (e) {
      debugPrint('_writeTxt:$e');
    }
  }
}
