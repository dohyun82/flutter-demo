import 'package:get/get.dart';


/// Simple 상태 관리자
class SimpleController extends GetxController{

  static SimpleController get to => Get.find();

  int counter = 0;
  void increment(){
    counter++;
    update();
  }
}