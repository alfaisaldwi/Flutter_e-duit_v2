import 'package:get/get.dart';

import '../controllers/kalkulator_duit_controller.dart';

class KalkulatorDuitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KalkulatorDuitController>(
      () => KalkulatorDuitController(),
    );
  }
}
