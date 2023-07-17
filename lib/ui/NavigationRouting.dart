import 'package:flutter/material.dart';

/// Navigation and routing
///
/// 1. Using the Navigator
/// 2. Using named routes
///   2-1. Limitations
/// 3. Using the Router
/// 4. Using Router and Navigator together
/// 5. Web support
/// 6. More information
class NavigationDemo extends StatelessWidget {
  const NavigationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigator 테스트"),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SongScreen()));
        },
        child: const Text("상세 화면"),
      ),
    );
  }
}

class SongScreen extends StatelessWidget {
  const SongScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("상세 화면"),
      ),
      body: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('뒤로가기'),
      ),
    );
  }
}
