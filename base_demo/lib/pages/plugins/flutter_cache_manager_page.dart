import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FlutterCacheManagerPage extends StatefulWidget {
  final String title;

  const FlutterCacheManagerPage({super.key, required this.title});

  @override
  State<FlutterCacheManagerPage> createState() =>
      _FlutterCacheManagerPageState();
}

class _FlutterCacheManagerPageState extends State<FlutterCacheManagerPage> {
  final url =
      'https://u7.iqiyipic.com/image/20240328/b7/69/pv_2448711522921100_d_601_480_270.jpg';

  Stream<FileResponse>? fileStream;

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
              const Text('FlutterCacheManager的使用'),
              FutureBuilder(
                future: DefaultCacheManager().getSingleFile(url),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                  } else if (snapshot.hasData) {
                    return Image.file(snapshot.data!);
                  } else if (snapshot.hasError) {
                    debugPrint('Error: ${snapshot.error}');
                    return Text('Error: ${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await DefaultCacheManager().emptyCache();
                },
                child: const Text('clear all cache file'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await DefaultCacheManager().removeFile(url);
                },
                child: const Text('clear single cache file'),
              ),
           
            ],
          ),
        ));
  }
}
