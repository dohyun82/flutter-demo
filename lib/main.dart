import 'package:flutter/material.dart';

///
/// Introduction to widgets
/// 위젯으로 UI 를 만드는 react 로 부터 영감을 받았다.
/// 위젯은 현재 구성 및 상태에 따라 뷰를 기술 한다.
/// 위젯의 상태가 변경되었을때, 위젯은 기술을 다시 한다.
/// 상태관리 여부에 따라, StatelessWidget 또는 StatefulWidget 상속한다.
/// 위젯 주 작업은 하위 레벨 위젯의 관점에서 기술하는 build() 함수를 구현하는 것이다.
///
void main() {
  /// runApp 함수는 주어진 위젯을 가져와서 루트로 만든다.
  runApp(
    /// Material 위젯을 사용하기 위해 MaterialApp 으로 실행한다.
    const MaterialApp(
      title: 'My app',
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key, required this.title}) : super(key: key);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'Example Title',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Hello, world!'),
            ),
          ),
        ],
      ),
    );
  }
}
