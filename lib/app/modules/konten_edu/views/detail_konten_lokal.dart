import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/konten_edu_controller.dart';

class DetailKontentLokalView extends GetView<KontenEduController> {
  var konten = Get.arguments;
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
                GestureDetector(
                  onTap: () async {
                    try {
                      final Uri _url = Uri.parse('${konten.link}');
                      await launchUrl(_url,
                          mode: LaunchMode.externalApplication);
                    } catch (err) {
                      debugPrint('Something bad happened');
                    }
                  },
                  child: Center(
                      child: Image.network('${konten.img}',
                          width: 400, height: 180)),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          width: 180,
                          child: Text(
                            '${konten.judul}',
                            style: GoogleFonts.inter(fontSize: 14),
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          String title = '${konten.judul}\n Link : ${
                            konten.link
                          } \nAyo download aplikasi e-duit untuk melihat artikel ini!';
                          String imageUrl = '${konten.img}';
                          String imagePath =
                              await controller.downloadImage(imageUrl);
                          controller.shareImage(imagePath, title);

                          // Share.share('${[konten.img]}',
                          //     subject: '${[konten.judul]}\n Link : ${[
                          //       konten.link
                          //     ]}');
                          print(konten.link);
                        },
                        child: Icon(
                          Icons.share,
                          size: 28,
                          color: Color(0xff034779),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${konten.penulis}',
                      style: GoogleFonts.inter(fontSize: 15),
                    ),
                    Wrap(children: [
                      Icon(
                        Icons.date_range,
                        size: 18,
                      ),
                      Text('${konten.tanggal}', style: GoogleFonts.inter()),
                    ]),
                    Icon(
                      Icons.thumb_up_alt_outlined,
                      color: Color(0xff034779),
                      size: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.white,
                  child: Text(
                    '${konten.isi}',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(height: 1.8),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
