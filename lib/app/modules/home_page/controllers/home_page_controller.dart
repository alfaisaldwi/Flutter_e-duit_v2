import 'package:eduit/app/data/kamusModel.dart';
import 'package:eduit/app/data/list_kamus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  TextEditingController tsearch = TextEditingController();
  var kmodel = KamusModel;
  List<KamusModel> kms = kamusData;
  List<CarouselItem> itemList = [
    CarouselItem(
      image: const NetworkImage(
        'https://miro.medium.com/max/1400/1*RpaR1pTpRa0PUdNdfv4njA.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
          'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'https://pbs.twimg.com/profile_banners/1444928438331224069/1633448972/600x200',
      ),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];

  Rx<List<KamusModel>> foundDic = Rx<List<KamusModel>>([]);

  @override
  void onInit() {
    super.onInit();
    foundDic.value;
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
      result = kamusData
          .where((element) =>
              'kata'.toString().toLowerCase().contains(DicName.toLowerCase()))
          .toList();
    }
    foundDic.value = result;
  }

  void searchKamus(String query) {
    final suggest = kms.where((kamusData) {
      final kataTitle = kamusData.kata!.toLowerCase();
      final input = query.toLowerCase();
      return kataTitle.contains(input);
    }).toList;

    
  }
  
}
