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

    Map<Permission, PermissionStatus> statuses = await [
  Permission.camera,
  Permission.photos,
].request();

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
