import 'package:eduit/app/modules/artikel_podcast/controllers/artikel_podcast_controller.dart';
import 'package:eduit/app/modules/game_quiz/controllers/game_quiz_controller.dart';
import 'package:eduit/app/modules/home_page/controllers/home_page_controller.dart';
import 'package:eduit/app/modules/kamus_keuangan_page/controllers/kamus_keuangan_page_controller.dart';
import 'package:eduit/app/modules/konten_edu/controllers/konten_edu_controller.dart';
import 'package:eduit/app/modules/utang_belajar/controllers/utang_belajar_controller.dart';
import 'package:get/get.dart';

import '../controllers/navbar_page_controller.dart';

class NavbarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
    );
    Get.lazyPut<ArtikelPodcastController>(
      () => ArtikelPodcastController(),
    );
    Get.lazyPut<GameQuizController>(
      () => GameQuizController(),
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
  }
}
