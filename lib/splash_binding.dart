import 'package:eduit/app/modules/account_page/controllers/account_page_controller.dart';
import 'package:eduit/app/modules/artikel_podcast/controllers/artikel_podcast_controller.dart';
import 'package:eduit/app/modules/game_quiz/controllers/game_quiz_controller.dart';
import 'package:eduit/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:eduit/app/modules/kalkulator_duit/controllers/kalkulator_duit_controller.dart';
import 'package:eduit/app/modules/kamus_keuangan_page/controllers/kamus_keuangan_page_controller.dart';
import 'package:eduit/app/modules/kirim_tulisan/controllers/kirim_tulisan_controller.dart';
import 'package:eduit/app/modules/konten_edu/controllers/konten_edu_controller.dart';
import 'package:eduit/app/modules/signup_page/controllers/signup_page_controller.dart';
import 'package:eduit/app/modules/utang_apbn/controllers/utang_apbn_controller.dart';
import 'package:eduit/app/modules/utang_belajar/controllers/utang_belajar_controller.dart';
import 'package:get/get.dart';

import 'app/modules/account_info/controllers/account_info_controller.dart';
import 'app/modules/login_page/controllers/login_page_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountPageController>(
      () => AccountPageController(),
    );
    Get.lazyPut<HomePageController>(
      () => HomePageController(),fenix: true
    );
    Get.lazyPut<KirimTulisanController>(
      () => KirimTulisanController(),
    );
    Get.lazyPut<ArtikelPodcastController>(
      () => ArtikelPodcastController(),
    );
    Get.lazyPut<AccountInfoController>(
      () => AccountInfoController(),
    );
    Get.lazyPut<GameQuizController>(
      () => GameQuizController(),
    );
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
    );
    Get.lazyPut<SignupPageController>(
      () => SignupPageController(),
    );
    Get.lazyPut<KontenEduController>(
      () => KontenEduController(),
    );
    Get.lazyPut<UtangBelajarController>(
      () => UtangBelajarController(),
    );
    Get.lazyPut<KamusKeuanganPageController>(
      () => KamusKeuanganPageController(),
    );
    Get.lazyPut<KirimTulisanController>(
      () => KirimTulisanController(),
    );
    Get.lazyPut<UtangApbnController>(
      () => UtangApbnController(),
    );
    Get.lazyPut<KalkulatorDuitController>(
      () => KalkulatorDuitController(),
    );
  }
}
