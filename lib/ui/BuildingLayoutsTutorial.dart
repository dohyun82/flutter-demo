import 'package:flutter/material.dart';

/// 레아아웃 튜토리얼
/// - 플러터 레이아웃 동작 방식
/// - 수평/수직 레아이웃 배치
/// - 플러터 레이아웃 빌드 방법

/// 0. 기본 코드 만들기
/// 1. 레이아웃 다이어그램
class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 제목 row 구현
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    '제목',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '부제목',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text('41'),
        ],
      ),
    );

    // 버튼 row 구현
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      );
    }

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, '전화'),
        _buildButtonColumn(color, Icons.near_me, '노선'),
        _buildButtonColumn(color, Icons.share, '공유'),
      ],
    );

    // 텍스트 Section
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '1번입니다 1번입니다 1번입니다 1번입니다 1번입니다 1번입니다 1번입니다 1번입니다'
        '2번입니다 2번입니다 2번입니다 2번입니다 2번입니다 2번입니다 2번입니다 2번입니다'
        '3번입니다',
        softWrap: true,
      ),
    );

    // 이미지 Section

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 레이아웃 데모'),
      ),
      body: ListView(
        children: [
          Image.asset(
            'images/lake.jpeg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ],
      ),
    );
  }
}
