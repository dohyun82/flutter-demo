import 'package:flutter/material.dart';

/// Image Cropper
/// https://pub.dev/packages/image_cropper
/// Android, iOS, Web
/// 서로 다른 3개의 네이티브 라이브러리를 기반하므로 서로 다른 UI
/// 이미지 조작을 Dart 로 하지 않고, Platform Channel 사용하여 네이티브 라이브러리 사용 (uCrop, TOCropViewController, croppie)
///
class MyImageCropperDemoApp extends StatelessWidget {
  const MyImageCropperDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        highlightColor: const Color(0xFFD0996F),
        canvasColor: const Color(0xFFFDF5EC),
        textTheme: TextTheme(
          headlineSmall: ThemeData.light()
              .textTheme
              .headlineSmall!
              .copyWith(color: const Color(0xFFBC764A)),
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[600],
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFBC764A),
          centerTitle: false,
          foregroundColor: Colors.white,
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFBC764A),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateColor.resolveWith(
              (states) => const Color(0xFFBC764A),
            ),
            side: MaterialStateBorderSide.resolveWith(
                (states) => const BorderSide(color: Color(0xFFBC764A))),
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          background: const Color(0xFFFDF5EC),
        ),
      ),
      home: const HomePage(
        title: 'Image Cropper Demo',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // XFile? _pickedFile;
  // CroppedFile? _croppedFile;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
