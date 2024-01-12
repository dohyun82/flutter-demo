import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/ListsAndGrids.dart';

void main() {
  runApp(MyLongList(
    items: List<String>.generate(10000, (index) => 'Item $index'),
  ));
}
