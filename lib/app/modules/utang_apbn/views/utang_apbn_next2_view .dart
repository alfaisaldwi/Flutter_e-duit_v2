import 'package:eduit/app/modules/utang_terkini/views/utang_terkini_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/utang_apbn_controller.dart';

class UtangApbnNext2View extends GetView<UtangApbnController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 42.0, right: 42, top: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lalu Apa Hasil dari ',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(fontSize: 24, color: Colors.black),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Utang Negara?',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'Utang Pemerintah digunakan untuk pembiayaan secara umum dan untuk membiayai kegiatan/proyek tertentu.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        height: 1.5, fontSize: 14, color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Untuk pembiayaan umum, utang digunakan antara lain untuk membiayai Belanja produktif dan Penyertaan Modal Negara (PMN).',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        height: 1.5, fontSize: 14, color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Text(
                    'Pemanfaatan utang negara yang produktif serta sumber pembiayaan yang efisien dan berisiko rendah akan meringankan beban generasi mendatang.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        height: 1.5, fontSize: 14, color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Text(
                    'Galeri Hasil Utang',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        height: 1.5,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomCarouselSlider(
                  items: controller.itemList,
                  height: 200,
                  subHeight: 0,
                  width: MediaQuery.of(context).size.width * .9,
                  autoplay: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: StadiumBorder()),
                      child: Text(
                        'Posisi utang terkini',
                        style: GoogleFonts.inter(
                            fontSize: 12, color: Color(0xff034779)),
                      ),
                      onPressed: () async {
                        await PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: UtangTerkiniView(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
