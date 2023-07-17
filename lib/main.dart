import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/StateManagement.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
void main() {
  runApp(
    const MaterialApp(
      title: "상태관리",
      home: MyApp(),
    ),
  );
}
