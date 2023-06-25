import 'package:get/get.dart';

import '../controllers/konten_edu_controller.dart';

class KontenEduBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KontenEduController>(
      () => KontenEduController(),
    );
  }
}
