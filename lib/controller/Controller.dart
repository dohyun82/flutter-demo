

import 'package:get/get.dart';

/// 비지니스 로직 클래스
class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}