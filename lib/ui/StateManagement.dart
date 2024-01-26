import 'package:flutter/material.dart';
import 'package:flutter_demo/model/StateManagementDemo.dart';
import 'package:provider/provider.dart';

class MyProviderApp extends StatelessWidget {
  const MyProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyProviderPage(),
    );
  }
}

class MyProviderPage extends StatelessWidget {
  const MyProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Text('total price: ${cart.totalPrice}');
      },
    );
  }
}
