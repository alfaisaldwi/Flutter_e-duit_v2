import 'package:get/get.dart';

import '../controllers/game_quiz_controller.dart';

class GameQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameQuizController>(
      () => GameQuizController(),
    );
  }
}
