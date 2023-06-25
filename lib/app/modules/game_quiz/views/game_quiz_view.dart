import 'package:eduit/app/data/quiz_list.dart';
import 'package:eduit/app/modules/game_quiz/views/result_quiz_view.dart';
import 'package:eduit/app/modules/home_page/views/home_page_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/game_quiz_controller.dart';

class GameQuizView extends GetView<GameQuizController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Container(
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30, top: 100),
          child: Column(
            children: [
              Text(
                '${quizData[controller.indexAnswerNow.value].pertanyaan}',
                style: GoogleFonts.inter(
                    fontSize: 22, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              MediaQuery.removePadding(
                removeTop: true,
                context: Get.context!,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                        children: [
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                // controller.changeIndexAnswerNow(index);
                                controller.isAnswer([
                                  controller.indexAnswerNow.value,
                                  quizData[controller.indexAnswerNow.value]
                                      .pilihan[index]
                                ]);
                                print(controller.isAnswer);
                              },
                              child: Container(
                                height: 70,
                                width: double.infinity,
                                padding: EdgeInsets.all(
                                  3,
                                ),
                                alignment: Alignment.centerLeft,
                                decoration: BoxDecoration(
                                  color: controller.isAnswer.contains(quizData[
                                              controller.indexAnswerNow.value]
                                          .pilihan[index])
                                      ? Color(0xffF8C800)
                                      : Colors.white,
                                  border: Border.all(
                                      color: Color(0xff5EE8D1), width: 2),
                                  borderRadius: BorderRadius.circular(14.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      quizData[controller.indexAnswerNow.value]
                                          .pilihan[index]),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      controller.isAnswer.clear();
                      controller.userAnswer.clear();
                      controller.changeIndexAnswerNow(0);
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: GameQuizView(),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );

                      // if (controller.indexAnswerNow.value != 0) {
                      //   controller.changeIndexAnswerNow(
                      //       controller.indexAnswerNow.value - 1);
                      // }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      height: 32,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffF8C800)),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          'Ulang',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(controller.userAnswer);
                      if (controller.indexAnswerNow.value >= 4) {
                        Future.delayed(
                          const Duration(seconds: 1),
                          () => Get.defaultDialog(
                              barrierDismissible: false,
                              radius: 25,
                              backgroundColor: Colors.white,
                              title: 'Konfirmasi',
                              titleStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              middleText: 'Yakin untuk menyelesaikan quiz?',
                              middleTextStyle:
                                  const TextStyle(color: Colors.black),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: const Text(
                                    'batal',
                                  ),
                                ),
                                const SizedBox(
                                  width: 46,
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    Get.back();
                                    print(controller.nilai);
                                    controller.userAnswer
                                        .add(controller.isAnswer.value);

                                    controller.submitAnswer();
                                    PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: ResultQuizView(),
                                      withNavBar:
                                          true, // OPTIONAL VALUE. True by default.
                                      pageTransitionAnimation:
                                          PageTransitionAnimation.fade,
                                    );
                                    print(controller.isAnswer);
                                    controller.userAnswer.clear();
                                    controller.isAnswer.clear();
                                    controller.indexAnswerNow(0);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  child: const Text(
                                    'Yakin',
                                  ),
                                ),
                              ]),
                        );
                      } else {
                        controller.changeIndexAnswerNow(
                            controller.indexAnswerNow.value + 1);
                        controller.userAnswer.add(controller.isAnswer.value);

                        print(controller.userAnswer);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      height: 32,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffF8C800)),
                          color: quizData[controller.indexAnswerNow.value]
                                      .pertanyaan!
                                      .length ==
                                  controller.indexAnswerNow.value - 1
                              ? Colors.green
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          controller.indexAnswerNow.value >= 4
                              ? "Kirim"
                              : "Lanjut",
                          style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: quizData[controller.indexAnswerNow.value]
                                              .pertanyaan!
                                              .length -
                                          1 ==
                                      controller.indexAnswerNow.value
                                  ? Colors.black
                                  : Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
