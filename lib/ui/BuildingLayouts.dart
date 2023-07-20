import 'package:flutter/material.dart';

/// 플러터 레이아웃
///
/// 1. 위젯은 UI 를 빌드하는데 사용하는 클래스
/// 2. 위젯은 UI 요소와 레이아웃을 둘다 사용
/// 3. 간단한 위젯을 구성하여 복잡한 위젯을 구축

// 수평/수직으로 여러 위젯 배치

// 중첩 수평/수직

// 위젯 크기
class SizingWidgetsDemo extends StatelessWidget {
  const SizingWidgetsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('위젯 크기'),
      ),
      body: buildHomePage(),
    );
  }

  Widget buildHomePage() {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(
          Icons.star,
          color: Colors.green,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
        ),
        Icon(
          Icons.star,
          color: Colors.black,
        ),
        Icon(
          Icons.star,
          color: Colors.black,
        ),
      ],
    );

    final ratings = Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 10,
            ),
          )
        ],
      ),
    );

    const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      letterSpacing: 0.5,
      fontSize: 11,
      height: 2,
    );

    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(
                  Icons.kitchen,
                  color: Colors.green[500],
                ),
                const Text('PREP'),
                const Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.timer,
                  color: Colors.green[500],
                ),
                const Text('COOK'),
                const Text('1 hour'),
              ],
            ),
            Column(
              children: [
                Icon(
                  Icons.restaurant,
                  color: Colors.green[500],
                ),
                const Text('FEEDS'),
                const Text('4~6'),
              ],
            ),
          ],
        ),
      ),
    );

    final leftColumn = Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        children: [
          const Text('제목'),
          const Text('부제목'),
          ratings,
          iconList,
        ],
      ),
    );

    return Center(
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 40, 0, 30),
        height: 600,
        child: Card(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 440,
                child: leftColumn,
              ),
              Expanded(
                child: Image.asset('images/lake.jpeg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
