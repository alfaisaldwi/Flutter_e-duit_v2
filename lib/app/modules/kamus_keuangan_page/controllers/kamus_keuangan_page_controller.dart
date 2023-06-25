import 'package:eduit/app/data/kamusModel.dart';
import 'package:eduit/app/data/list_kamus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class KamusKeuanganPageController extends GetxController {
  TextEditingController cFind = TextEditingController();
  List<KamusModel> kms = kamusData;
  Rx<List<KamusModel>> foundDic = Rx<List<KamusModel>>([]);

  @override
  void onInit() {
    super.onInit();
    foundDic.value = kamusData;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void filterDic(String DicName) {
    List<KamusModel>? result = [];
    if (DicName.isEmpty) {
      result = kamusData;
    } else {
      final suggest = kms.where((kamus) {
        final kataTitle = kamus.kata!.toLowerCase();
        final input = DicName.toLowerCase();
        return kataTitle.contains(input);
      }).toList();

      foundDic.value = suggest;

    }
  }


}
