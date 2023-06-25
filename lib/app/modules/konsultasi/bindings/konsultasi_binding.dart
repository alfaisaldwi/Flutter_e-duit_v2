import 'package:get/get.dart';

import '../controllers/konsultasi_controller.dart';

class KonsultasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KonsultasiController>(
      () => KonsultasiController(),
    );
  }
}
