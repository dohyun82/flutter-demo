import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// State management
///
/// Think declaratively
///
/// Differentiate between ephemeral state and app state
/// 1. Ephemeral state
/// 2. App state
///
class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (newIndex) {
        setState(() {
          _index = newIndex;
        });
      },
      items: [],
    );
  }
}

class Item {}

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => _items.length * 42;

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상태관리'),
      ),
      body: ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: Column(
          children: [
            Consumer<CartModel>(
              builder: (context, cart, child) {
                return Text(
                  'Total price: ${cart.totalPrice}',
                );
              },
            ),
            TextButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).removeAll();
              },
              child: Text("테스트"),
            ),
          ],
        ),
      ),
    );
  }
}
