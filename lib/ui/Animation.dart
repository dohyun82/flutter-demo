import 'dart:math';

import 'package:flutter/material.dart';

///
/// Implicit Animation
/// 1. AnimatedAlign
///
class AnimatedAlignScreen extends StatefulWidget {
  const AnimatedAlignScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedAlignScreen> createState() => _AnimatedAlignScreenState();
}

class _AnimatedAlignScreenState extends State<AnimatedAlignScreen> {
  var alignment = Alignment.bottomLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedAlign'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: AnimatedAlign(
                alignment: alignment,
                duration: const Duration(milliseconds: 100),
                child: const FlutterLogo(
                  size: 150,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    alignment = alignment == Alignment.bottomLeft
                        ? Alignment.topRight
                        : Alignment.bottomLeft;
                  });
                },
                icon: const Icon(Icons.star))
          ],
        ),
      ),
    );
  }
}

class AnimatedContainerScreen extends StatefulWidget {
  const AnimatedContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerScreen> createState() =>
      _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedContainer'),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 300.0 : 100.0,
            height: selected ? 100.0 : 300.0,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
              border: selected
                  ? Border.all(color: Colors.black, width: 3)
                  : Border.all(color: Colors.red, width: 3),
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: selected
                    ? [Colors.lightGreen, Colors.redAccent]
                    : [Colors.orange, Colors.deepOrangeAccent],
                stops: const [0.0, 1.0],
              ),
              color: selected ? Colors.red : Colors.blue,
            ),
            curve: Curves.fastOutSlowIn,
            child: const FlutterLogo(
              size: 75,
            ),
          ),
        ),
      ),
    );
  }
}

const owlUrl =
    'https://raw.githubusercontent.com/flutter/website/main/src/assets/images/docs/owl.jpg';

class FadeInDemo extends StatefulWidget {
  const FadeInDemo({Key? key}) : super(key: key);

  @override
  State<FadeInDemo> createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fade-in'),
      ),
      body: Column(
        children: [
          Image.network(owlUrl),
          TextButton(
            onPressed: () {
              setState(() {
                if (opacity == 1.0) {
                  opacity = 0.0;
                } else {
                  opacity = 1.0;
                }
              });
            },
            child: const Text(
              'Show Details',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(seconds: 2),
            opacity: opacity,
            child: Column(
              children: const [
                Text('Type: Owl'),
                Text('Age: 39'),
                Text('Employment: None'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

const _duration = Duration(milliseconds: 400);

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  const AnimatedContainerDemo({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerDemo> createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainer')),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: AnimatedContainer(
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                duration: _duration,
                curve: Curves.easeInOutBack,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  change();
                },
                child: const Text('changed')),
          ],
        ),
      ),
    );
  }
}
