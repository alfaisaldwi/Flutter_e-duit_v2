import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduit/app/data/konten_list.dart';
import 'package:eduit/app/data/konten_model.dart';
import 'package:eduit/app/data/list_kamus.dart';
import 'package:eduit/app/modules/konten_edu/views/detail_konten_lokal.dart';
import 'package:eduit/app/modules/konten_edu/views/detail_kontent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/konten_edu_controller.dart';

class KontenEduView extends GetView<KontenEduController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCarouselSlider(
                  items: controller.itemList,
                  height: 200,
                  subHeight: 0,
                  width: MediaQuery.of(context).size.width * .9,
                  autoplay: true,
                ),
                SizedBox(
                  height: 2,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: kontenData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailKontentLokalView(),
                              arguments: kontenData[index]);
                        },
                        child: Container(
                          height: 120,
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          child: Row(children: [
                            Image.network(kontenData[index].img!,
                                width: 140, height: 140),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, bottom: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '${kontenData[index].judul}',
                                      textAlign: TextAlign.left,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${kontenData[index].penulis}'),
                                        Wrap(children: [
                                          Icon(
                                            Icons.date_range,
                                            size: 18,
                                          ),
                                          Text('${kontenData[index].tanggal}'),
                                        ]),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    }),
                Obx(() => ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: controller.documents.length,
                    itemBuilder: (context, index) {
                      final konten = controller.documents[index];
                      print(controller.documents);
                      return GestureDetector(
                        onTap: () {
                          controller.getLikeCount(konten.id);
                          print(controller.likeCount);
                          Get.to(() => DetailKontentView(),
                              arguments: [konten, konten.id]);
                        },
                        child: Container(
                          height: 120,
                          padding: EdgeInsets.all(5),
                          width: double.infinity,
                          child: Row(children: [
                            Image.network(
                              konten['imgUrl'],
                              width: 140,
                              height: 140,
                              fit: BoxFit.fill,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, bottom: 4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      '${konten['judul']}',
                                      textAlign: TextAlign.left,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('${konten['penulis']}'),
                                        Wrap(children: [
                                          Icon(
                                            Icons.date_range,
                                            size: 18,
                                          ),
                                          Text('${konten['tanggal']}'),
                                        ]),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]),
                        ),
                      );
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
