import 'package:get/get.dart';

import '../controllers/utang_belajar_controller.dart';

class UtangBelajarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtangBelajarController>(
      () => UtangBelajarController(),
    );
  }
}
