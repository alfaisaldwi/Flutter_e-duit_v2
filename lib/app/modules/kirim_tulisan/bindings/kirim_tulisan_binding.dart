import 'package:get/get.dart';

import '../controllers/kirim_tulisan_controller.dart';

class KirimTulisanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KirimTulisanController>(
      () => KirimTulisanController(),
    );
  }
}
