import 'package:get/get.dart';

import '../controllers/artikel_podcast_controller.dart';

class ArtikelPodcastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArtikelPodcastController>(
      () => ArtikelPodcastController(),
    );
  }
}
