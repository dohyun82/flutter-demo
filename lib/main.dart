import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/ui/AdvancedUI.dart';
import 'package:flutter_demo/ui/BuildingLayouts.dart';
import 'package:flutter_demo/ui/CommonLayoutWidgets.dart';
import 'package:flutter_demo/ui/IntroductionToWidgets.dart';
import 'package:flutter_demo/ui/JsonSerialization.dart';
import 'package:flutter_demo/ui/StateManagement.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// User interface

// 일반적인 위젯들

// ListView
void main() {
  runApp(
    const MaterialApp(
      home: ListViewDemo(),
    ),
  );
}

// GridView
// void main() {
//   runApp(
//     const MaterialApp(
//       home: GridViewDemo(),
//     ),
//   );
// }

// Container
// void main() {
//   runApp(
//     const MaterialApp(
//       home: ContainerDemo(),
//     ),
//   );
// }

// 위젯 사이징
// void main() {
//   debugPaintSizeEnabled = true;
//   runApp(
//     const MaterialApp(
//       title: "위젯 크기",
//       home: SizingWidgetsDemo(),
//     ),
//   );
// }

// non 머티리얼 앱
// void main() {
//   debugPaintSizeEnabled = true;
//   runApp(const NonMaterialDemo());
// }

// 머티리얼 앱
// void main() {
//   runApp(
//     MaterialApp(
//       title: '레이아웃',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('레이아웃'),
//         ),
//         body: const MyLayoutDemo(),
//       ),
//     ),
//   );
// }

// void main() {
//   debugPaintSizeEnabled = true;
//   runApp(
//     const MaterialApp(
//       title: '쇼핑 앱',
//       home: ShoppingList(
//         products: [
//           Product(name: 'Eggs'),
//           Product(name: 'Flour'),
//           Product(name: 'Chocolate chips'),
//         ],
//       ),
//     ),
//   );
// }

// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Flutter Tutorial',
//       home: TutorialHome(),
//     ),
//   );
// }
// void main() {
//   runApp(
//     const MaterialApp(
//       // Material 디자인 위젯을 사용하기 위해 감쌈
//       title: 'My app',
//       home: SafeArea(
//         child: MyScaffold(),
//       ),
//     ),
//   );
// }
// void main() {
//   // 최소한의 Flutter 앱은 위젯과 함께 runApp() 호출
//   runApp(
//     // 위젯 트리의 루트 위젯
//     const Center(
//       // 자식 위젯
//       child: Text(
//         'Hello, world!',
//         textDirection: TextDirection.ltr, // MaterialApp 을 적용하면 생략 가능
//       ),
//     ),
//   );
// }

/// Introduction to widgets
// void main() {
//   // runApp 함수 호출(Root Widget 포함)
//   runApp(
//     const MaterialApp(
//       title: 'Shopping App',
//       home: ShoppingList(
//         products: [
//           Product(name: 'Eggs'),
//           Product(name: 'Flour'),
//           Product(name: 'Chocolate chips'),
//         ],
//       ),
//     ),
//   );
// }

/// Tutorial
// void main() => runApp(MyApp());

/// Introduction to animations
// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Animation',
//       home: AnimatedContainerDemo(),
//     ),
//   );
// }

/// Navigation and routing
// void main() {
// runApp(MaterialApp(
//   title: 'Navigation & Routing',
//   home: NavigationDemo(),
//   routes: {
//     '/': (context) => NavigationDemo(),
//     '/details': (context) => SongScreen()
//   },
// ));
// }

/// State Management
// void main() {
//   runApp(
//     const MaterialApp(
//       title: "상태관리",
//       home: MyApp(),
//     ),
//   );
// }

/// JSON and serialization
// void main() {
//   runApp(
//     const MaterialApp(
//       title: "JSON Serialization",
//       home: MyJsonDemo(),
//     ),
//   );
// }

/// Advanced UI
// void main() {
//   runApp(
//     const MaterialApp(
//       title: "Advanced UI",
//       home: MyAdvancedUIDemo(),
//     ),
//   );
// }
