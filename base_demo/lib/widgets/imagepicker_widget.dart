import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  ImagePickerWidgetState createState() => ImagePickerWidgetState();
}

class ImagePickerWidgetState extends State<ImagePickerWidget> {
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  void _pickImage() async {
    PermissionStatus status = await Permission.photos.status;

    if (status.isGranted) {
      // 权限已经被授予
      // 在这里可以执行相关操作
      debugPrint('用户已授权相册访问权限');
    } else {
      // 权限尚未被授予，需要请求权限
      Map<Permission, PermissionStatus> statuses = await [
        Permission.photos,
      ].request();
      
      // 处理权限请求的结果
      if (statuses[Permission.photos] == PermissionStatus.granted) {
        // 用户已授予相册访问权限
        
      } else {
        // 用户拒绝了相册访问权限
        debugPrint('用户拒绝了相册访问权限');
        return;
      }
    }

    final XFile? imageFile =
            await _picker.pickImage(source: ImageSource.gallery);
        if (imageFile != null) {
          setState(() {
            _imageFile = imageFile;
          });
        }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _imageFile == null
            ? const Text('no image selected!')
            : Image.file(
                File(_imageFile!.path),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
        ElevatedButton(
            onPressed: () {
              _pickImage();
            },
            child: const Text("please pick image"))
      ],
    );
  }
}
