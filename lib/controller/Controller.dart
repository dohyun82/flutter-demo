

import 'package:get/get.dart';

/// 비지니스 로직 클래스
class Controller extends GetxController{
  var count = 0.obs;
  final count1 = 0.obs;
  final count2 = 0.obs;
  int get sum => count1.value + count2.value;

  @override
  void onInit() {
    super.onInit();
  }

  increment(){
    count.value++;
  }

  increment1(){
    count1.value++;
  }

  increment2(){
    count2.value++;
  }

}