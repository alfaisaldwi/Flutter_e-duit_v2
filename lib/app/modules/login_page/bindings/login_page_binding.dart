import 'package:eduit/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';


import '../controllers/login_page_controller.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    // Get.lazyPut<ProfilePageController>(() => ProfilePageController());
    // Get.lazyPut<SmartphoneAddController>(() => SmartphoneAddController());
    // Get.lazyPut<DetailReviewController>(() => DetailReviewController());
  }
}
