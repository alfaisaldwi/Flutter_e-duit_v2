import 'package:get/get.dart';

import '../controllers/account_page_controller.dart';

class AccountPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountPageController>(
      () => AccountPageController(),
    );
  }
}
