import 'dart:io';
import 'dart:typed_data';

import 'package:base_demo/common/file_mgr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter/services.dart' show rootBundle;

class ImageCompressPage extends StatefulWidget {
  const ImageCompressPage({super.key});

  @override
  State<ImageCompressPage> createState() => _ImageCompressPageState();
}

class _ImageCompressPageState extends State<ImageCompressPage> {
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_image_compress'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _imageFile != null
              ? Image.file(
                  _imageFile!,
                  width: 500,
                  height: 500,
                  fit: BoxFit.contain,
                )
              : Container(),
          ElevatedButton(
              onPressed: () {
                compressImageAndDisplay();
              },
              child: const Text('图片压缩:compressImageAndDisplay')),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                compressImageWithQualityAndDisplay();
              },
              child: const Text('图片压缩:compressImageWithQualityAndDisplay')),
        ]),
      ),
    );
  }

  Future<void> compressImageAndDisplay() async {
    ByteData data = await rootBundle.load('assets/images/large_image.png');
    List<int> compressedImage = await FlutterImageCompress.compressWithList(
      data.buffer.asUint8List(),
      minHeight: 1920,
      minWidth: 1080,
      quality: 80,
    );

    debugPrint(
        'before compressImage data:${data.lengthInBytes}, after compressImage data:${compressedImage.length} ');

    final tempPath = await FileMgr.instance.getDocumentsDirectory();
    final File imgFile = await File('$tempPath/compressed_image.jpg')
        .writeAsBytes(compressedImage);

    setState(() {
      _imageFile = imgFile;
    });


  debugPrint('cacheDirectory:${await FileMgr.instance.getApplicationSupportDirectoryPath()}\n documentsDirectory:${await FileMgr.instance.getDocumentsDirectory()} \n temporaryDirectoryPath:${await FileMgr.instance.getTemporaryDirectoryPath()}');

  }

  // 1. compress file and get Uint8List
  Future<void> compressImageWithQualityAndDisplay() async {
    ByteData data = await rootBundle.load('assets/images/large_image.png');
    List<int> compressedImage = await FlutterImageCompress.compressWithList(
      data.buffer.asUint8List(),
      minHeight: 1920,
      minWidth: 1080,
      quality: 80,
      rotate: 90,
    );

    debugPrint(
        'before compressImage data:${data.lengthInBytes}, after compressImage data:${compressedImage.length} ');

    final tempPath = await FileMgr.instance.getDocumentsDirectory();
    final File imgFile = await File('$tempPath/compressed_image1.jpg')
        .writeAsBytes(compressedImage);

    setState(() {
      _imageFile = imgFile;
    });
  }

  Future<Widget> _compressImageToWidget() async {
    ByteData data = await rootBundle.load('assets/images/large_image.png');

    ImageProvider provider = MemoryImage(data.buffer.asUint8List());
    return Image(image: provider);
  }
}
