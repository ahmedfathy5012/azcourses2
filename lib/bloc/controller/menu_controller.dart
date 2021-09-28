import 'package:get/get.dart';

class MenuController extends GetxController {
  bool isCollapsed = true.obs();
  bool isNotify = false.obs();
  changeIsCollapsed() {
    isCollapsed = !isCollapsed;
    update();
  }

  changeIsNotify() {
    isNotify = !isNotify;
    update();
  }
}
