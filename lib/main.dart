import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/IntroductionToWidgets.dart';

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
/// Building layouts
/// Step 0:Create the app base code
/// Step 1:Diagram the layout
/// Step 2:Implement the title row
/// Step 3:Implement the button row
/// Step 4:Implement the text Section
/// Step 5:Implement the image section
/// Step 6:Final touch
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 제목 섹션
    Widget titleSection = Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: const Text(
                      '제목입니다.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Text(
                  '부제목입니다.',
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

    Color color = Theme.of(context).primaryColor;

    /// 버튼 섹션
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.add_call, 'Call'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        '텍스트 입니다.1'
        '텍스트 입니다.2'
        '텍스트 입니다.3'
        '텍스트 입니다.4',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(children: [
          Image.asset(
            'images/lake.jpeg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
        ]),
      ),
    );
  }

  /// 버튼 Column
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
}
