import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/IntroductionToWidgets.dart';

/// Introduction to widgets
void main() {
  // runApp 함수 호출(Root Widget 포함)
  runApp(
    const MaterialApp(
      title: 'Shopping App',
      home: ShoppingList(
        products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ],
      ),
    ),
  );
}
