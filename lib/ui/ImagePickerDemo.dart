import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// Image Picker
/// https://pub.dev/packages/image_picker
/// Android, iOS, Web
///
class MyImagePickerDemoApp extends StatelessWidget {
  const MyImagePickerDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Picker Demo',
      home: MyHomePage(
        title: 'Image Picker Example',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<XFile>? _mediaFileList;

  void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
