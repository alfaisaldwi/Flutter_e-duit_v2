import 'package:get/get.dart';

import '../controllers/utang_terkini_controller.dart';

class UtangTerkiniBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UtangTerkiniController>(
      () => UtangTerkiniController(),
    );
  }
}
