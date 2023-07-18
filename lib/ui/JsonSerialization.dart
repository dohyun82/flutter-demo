import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_demo/model/user.dart';

class MyJsonDemo extends StatelessWidget {
  const MyJsonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String jsonString = '{"name": "John Smith", "email": "john@example.com"}';

    Map<String, dynamic> userMap = jsonDecode(jsonString);
    var user = User.fromJson(userMap);

    print('Howdy, ${user.name}!');
    print('We sent the verification link to ${user.email}.');

    String json = jsonEncode(user);
    print('User to jsonString : $json');

    return const Placeholder();
  }
}
