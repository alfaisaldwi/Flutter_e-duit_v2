import 'package:get/get.dart';

import '../controllers/utang_apbn_controller.dart';

class UtangApbnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtangApbnController>(
      () => UtangApbnController(),
    );
  }
}
