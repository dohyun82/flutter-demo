

import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/Controller.dart';
import 'package:flutter_demo/controller/SimpleController.dart';
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
      body: Column(
        children: [
          GetBuilder<SimpleController>(
            init: SimpleController(),
            builder: (_) {
              return Text(
                  '${_.counter}'
              );
            }
          ),
          GetX<Controller>(
            builder: (controller){
              return Text('${controller.count1.value}');
            },
          ),
          GetX<Controller>(
            builder: (controller) {
              return Text('${controller.count2.value}');
            },
          ),
          GetX<Controller>(
            builder: (controller){
              return Text('${controller.sum}');
            }
          ),
          Center(child: ElevatedButton(
              child: const Text("Go to Splash"),
              onPressed: ()=>Get.to(const SplashPage()))),
          Center(child: ElevatedButton(
              child: const Text("Go to Other"),
              onPressed: (){
                Get.to(Other());
              }
          )),
          Center(child: ElevatedButton(
              child: const Text("Go to Navigator"),
              onPressed: (){
                Get.to(const NavigatorPage());
              }
          )),
        ],
      ),

      floatingActionButton:
        FloatingActionButton(child: const Icon(Icons.add), onPressed: (){
          c.increment();
          c.increment1();
          c.increment2();
          SimpleController.to.increment();
        }));
  }
}

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);
  // 다른 페이지에서 사용되는 컨트롤러를 Get 으로 찾아서 redirect 할 수 있다.
  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${c.count}"),
      ),
        body: Column(children: [
          ElevatedButton(
              onPressed: (){
                Get.back();
              },
              child: const Text("Go Back")
          ),
          Center(
              child: Text("${c.count}")
          )
        ]),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Get.snackbar("Hi", "rkwkgo");
            Get.off(Other());
          },
          child: const Text("닫기"),
        ),
      ),
    );
  }
}

class NavigatorPage extends StatelessWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(1),
      initialRoute: '/',
      onGenerateRoute: (settings){
        if(settings.name == '/'){
          return GetPageRoute(
            page: () => Scaffold(
              appBar: AppBar(
                title: const Text("Main"),
              ),
              body: Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed('/second', id:1);
                  },
                  child: const Text("Go to second"),
                ),
              ),
            )
          );
        }else if(settings.name == '/second'){
          return GetPageRoute(
            page: () => Center(
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Main'),
                ),
                body: const Center(
                  child: Text('second'),
                ),
              ),
            )
          );
        }
      },
    );
  }
}



