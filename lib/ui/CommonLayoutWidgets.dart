import 'package:flutter/material.dart';

/// 일반적인 레이아웃 위젯들

/// ListView
/// Column 위젯과 비슷하지만 자동 스크롤링 기능 제공
/// 수평/수직 가능
class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    return ListView(
      children: [
        _tile('제목1', '부제목1', Icons.theaters),
        _tile('제목1', '부제목1', Icons.theaters),
        _tile('제목1', '부제목1', Icons.theaters),
        _tile('제목1', '부제목1', Icons.theaters),
        _tile('제목1', '부제목1', Icons.theaters),
        _tile('제목1', '부제목1', Icons.theaters),
        _tile('제목1', '부제목1', Icons.theaters),
        const Divider(),
        _tile('제목1', '부제목1', Icons.restaurant),
        _tile('제목1', '부제목1', Icons.restaurant),
        _tile('제목1', '부제목1', Icons.restaurant),
        _tile('제목1', '부제목1', Icons.restaurant),
        _tile('제목1', '부제목1', Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subTitle, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subTitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}

/// GridView
/// 그리드에 위젯 배치
/// 수직이 랜더 박스를 초과하면 자동 스크롤링
/// GridView.count, GridView.extent
class GridViewDemo extends StatelessWidget {
  const GridViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildGrid(),
      ),
    );
  }

  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 300,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(5),
      );

  List<Container> _buildGridTileList(int count) => List.generate(
        count,
        (index) => Container(
          child: Image.asset('images/lake$index.jpeg'),
        ),
      );
}

/// Container
/// 패딩, 마진, 보더
/// 백그라운드 색상, 이미지
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildImageColumn(),
      ),
    );
  }

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black38),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: Image.asset('images/lake$imageIndex.jpeg'),
        ),
      );

  Widget _buildImageRow(int imageIndex) => Row(
        children: [
          _buildDecoratedImage(imageIndex),
          _buildDecoratedImage(imageIndex + 1),
        ],
      );

  Widget _buildImageColumn() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );
  }
}
