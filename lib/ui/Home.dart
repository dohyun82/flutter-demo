

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/controller/Controller.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 클래스를 인스터스화 하여 모든 child 에서 사용 가능하게 처리
    final Controller c = Get.put(Controller());

    return Scaffold(
      // count 가 변경 될 때마다 Obx(()=> 를 사용하여 Text() 업데이트
      appBar: AppBar(title: Obx(()=> Text("Clicks: ${c.count}"))),
      // Navigator.push 를 Get.to 로 변경, context 불필요
      body: Center(child: ElevatedButton(
        child: const Text("Go to Other"), onPressed: ()=>Get.to(Other()))),

      floatingActionButton:
        FloatingActionButton(child: const Icon(Icons.add), onPressed: c.increment));
  }
}

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);
  // 다른 페이지에서 사용되는 컨트롤러를 Get 으로 찾아서 redirect 할 수 있다.
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}

