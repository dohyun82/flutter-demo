import 'package:flutter/material.dart';

/// 플러터 레이아웃
///
/// 1. 위젯은 UI 를 빌드하는데 사용하는 클래스
/// 2. 위젯은 UI 요소와 레이아웃을 둘다 사용
/// 3. 간단한 위젯을 구성하여 복잡한 위젯을 구축

class NonMaterialDemo extends StatelessWidget {
  const NonMaterialDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Center(
        child: Text(
          'Hello World',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class MyLayoutDemo extends StatelessWidget {
  const MyLayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('헬로우'),
    );
  }
}
