import 'dart:ffi';

import 'package:flutter/material.dart';

/// 위젯 소개
/// - 위젯으로 UI 를 구축
/// - 위젯은 현재 구성과 상태에 따라 어떻게 보여야 할지 기술
/// - 위젯 상태가 변경되면 프레임워크는 기본 랜더링 트리에서, 한 상태에서 다음 상태로 전환하는데 필요한 최소한의 변경 사항을 결정하기 위해, 이전 기술과 비교 하는 기술을 다시 빌드
///
/// 새로운 위젯 만들때 상속하는 위젯 클래스
/// - StatelessWidget(상태 관리 X) or StatefulWidget(상태 관리 O)
///
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // 주 작업 구현 함수
  // 하위 레벨 위젯의 관점에서 기술
  // 프레임워크는 geometry 를 기술하고 계산하는 기본 RenderObject 를 나타내는 위젯에서 프로세스가 끝날때까지 위젯을 차례로 빌드
  @override
  Widget build(BuildContext context) {
    return const MyAppBar.defaultTitle();
  }
}

class Product {
  const Product({required this.name});
  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
    Key? key,
  }) : super(key: key);

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({required this.products, Key? key}) : super(key: key);

  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('쇼핑 리스트'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanged: _handleCartChanged);
        }).toList(),
      ),
    );
  }
}

/// 입력에 대한 반응으로 위젯 변경하기
/// 알림 변경은 위로, 상태는 아래로 흐름

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({required this.count, Key? key}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}

class CounterIncrementor extends StatelessWidget {
  const CounterIncrementor({required this.onPressed, Key? key})
      : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Text('증가'),
    );
  }
}

/// StatefulWidget 은 현재 상태를 나타내기 위한 임시 객체
class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

/// build 가 호출 되는 중에도 정보를 지속적 으로 기억함
class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      // 상태가 변경 되었음을 플러터 프레임워크에 알리고, 빌드를 다시 하도록 한다.
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    // setState() 호출 될때마다 리턴
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CounterIncrementor(onPressed: _increment),
        const SizedBox(
          width: 16,
        ),
        CounterDisplay(count: _counter),
      ],
    );
  }
}

/// 제스처 다루기
class MyButton extends StatelessWidget {
  const MyButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}

/// 머티리얼 컴포넌트 사용하기
/// - MaterialApp 루트 위젯으로 시작
class TutorialHome extends StatelessWidget {
  const TutorialHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold 는 주요 머티리얼 컴포넌트의 레이아웃
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
        ),
        title: const Text('머티리얼 데모'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: const Center(
        child: Counter(),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

/// 기본 위젯
/// 1. Text : 스타일 텍스트
/// 2. Row, Column : 수평(Row), 수직(Column)
/// 3. Stack : 페인트 순서에 따라 각 위젯의 위에 배치, Positioned 위젯으로 위치 지정
/// 4. Container : BoxDecoration(background, border, shadow) 과 함께 사격형 위젯 생성, margins, padding, constraints 적용
class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, Key? key}) : super(key: key);

  const MyAppBar.defaultTitle({Key? key})
      : this(title: const Text('테스트'), key: key);

  // 위젯 하위 클래스의 필드는 항상 final 로 표기
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56, // 높이
      padding: const EdgeInsets.symmetric(horizontal: 8), // 수평 패딩
      decoration: BoxDecoration(
        // Decoration
        color: Colors.blue[500], // 색상
      ),
      child: Row(
        // 수평 선형 위젯
        children: [
          const IconButton(
            // 아이콘 버튼 위젯
            icon: Icon(Icons.menu), // 아이콘
            tooltip: 'Navigation menu',
            onPressed: null, // 버튼 비활성화
          ),
          Expanded(
            // 자식 위젯을 가능한 가득 채움
            // 여러개 가질 수 있으며, flex 로 비율 조절 가능
            child: title,
            flex: 1,
          ),
          const IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
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
    // Material 위젯은 UI 가 나타나는 개념 조각
    return Material(
      // 수직 선형 위젯
      child: Column(
        children: [
          MyAppBar(
            // 위젯을 인수로 전달하는것은 다양한 방법으로 재사용 할 수 있는 위젯을 만드는 강력한 방법
            title: Text(
              'Example title',
              style: Theme.of(context).primaryTextTheme.titleLarge,
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
