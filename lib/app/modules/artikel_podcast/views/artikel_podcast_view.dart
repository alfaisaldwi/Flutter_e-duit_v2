import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/artikel_podcast_controller.dart';

class ArtikelPodcastView extends GetView<ArtikelPodcastController> {
  @override
  Widget build(BuildContext context) {
    var dat = Get.arguments;
    dat;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, right: 14, top: 50),
          child: Column(
            children: [
              Column(
                children: [
                  AnimSearchBar(
                    rtl: true,
                    width: 400,
                    helpText: 'Cari..',
                    color: Color(0xffF8C800),
                    textController: controller.tsearch,
                    onSuffixTap: () {
                      controller.tsearch.clear();
                    },
                    onSubmitted: (String) {},
                  ),
                  CustomCarouselSlider(
                    items: controller.itemList,
                    height: 180,
                    subHeight: 50,
                    width: MediaQuery.of(context).size.width * .9,
                    autoplay: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.car_rental,
                      size: 50,
                    ),
                    title: Text('Car'),
                  ),  
                  SizedBox(
                    height: 21,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
