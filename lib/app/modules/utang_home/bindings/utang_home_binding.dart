import 'package:get/get.dart';

import '../controllers/utang_home_controller.dart';

class UtangHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtangHomeController>(
      () => UtangHomeController(),
    );
  }
}
