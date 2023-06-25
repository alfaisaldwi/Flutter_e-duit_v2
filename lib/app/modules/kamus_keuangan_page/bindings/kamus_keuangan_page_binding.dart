import 'package:get/get.dart';

import '../controllers/kamus_keuangan_page_controller.dart';

class KamusKeuanganPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KamusKeuanganPageController>(
      () => KamusKeuanganPageController(),
    );
  }
}
