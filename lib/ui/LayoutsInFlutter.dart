import 'package:flutter/material.dart';

/// Layouts in Flutter
/// 1. Widgets 은 UI 를 만드는데 사용하는 클래스
/// 2. Widgets 은 UI 요소 와 레이아웃에 사용
/// 3. 간단한 Widgets 구성하여 복잡한 Widgets 을 빌드
///
/// Lay out a widget
/// 1. Select a layout widget
/// 2. Create a visible widget
/// 3. Add the visible widget to the layout widget
/// 4. Add the layout widget to the page
///
/// Lay out multiple widgets vertically and horizontally
/// 1. Aligning widgets
/// 2. Sizing widgets
/// 3. Packing widgets
/// 4. Nesting rows and columns
///
/// Common layout widgets
/// 1. Standard widgets
/// 2. Material widgets
/// 3. Container
/// 4. GridView
/// 5. ListView
/// 6. Stack
/// 7. Card
/// 8. ListTile
///
/// Constraints
///
///

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: const Center(
          child: Text('Hello world'),
        ),
      ),
    );
  }

  /// 3. Container

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 10, color: Colors.black38),
              borderRadius: const BorderRadius.all(Radius.circular(8))),
          margin: const EdgeInsets.all(4),
          child: Image.asset('images/pic$imageIndex.jpg'),
        ),
      );

  Widget _buildImageRow(int imageIndex) => Row(
        children: [
          _buildDecoratedImage(imageIndex),
          _buildDecoratedImage(imageIndex + 1)
        ],
      );

  Widget _buildImageColumn() {
    return Container(
      decoration: const BoxDecoration(color: Colors.black26),
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );
  }

  /// 4. GridView

  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(30),
      );

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
            child: Image.asset('images/pic$i.jpg'),
          ));

  /// 5. ListView

  Widget _buildList() {
    return ListView(
      children: [
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        const Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
        _tile('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
        _tile('La Ciccia', '291 30th St', Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }

  /// 6. Stack

  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/pic.jpg'),
          radius: 100,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: const Text(
            'Mia B',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  /// 7. Card

  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text(
                '1006동 802호',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: const Text('서울시 은평구 진관3로'),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(
                '(408) 555-1212',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: const Text('rkwkgo@gmail.com'),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 8. ListTile

}
