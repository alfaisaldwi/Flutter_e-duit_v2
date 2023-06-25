import 'package:get/get.dart';

import '../controllers/daftar_ymyb_controller.dart';

class DaftarYmybBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DaftarYmybController>(
      () => DaftarYmybController(),
    );
  }
}
