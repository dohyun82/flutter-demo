import 'package:flutter/material.dart';

class MyMultipleLayoutDemo extends StatelessWidget {
  const MyMultipleLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyMultipleLayoutBody(),
      ),
    );
  }
}

class MyMultipleLayoutBody extends StatelessWidget {
  const MyMultipleLayoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black26,
      ),
      child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ],
      ),
    );
  }

  Widget _buildDecoratedImage(int imageIndex) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black38),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          margin: const EdgeInsets.all(4),
          child: Image.asset(
            'images/lake$imageIndex.jpeg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _buildImageRow(int imageIndex) => Row(
        children: [
          _buildDecoratedImage(imageIndex),
          _buildDecoratedImage(imageIndex + 1),
        ],
      );
}
