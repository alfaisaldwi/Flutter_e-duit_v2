import 'package:eduit/app/modules/utang_apbn/views/utang_apbn_next2_view%20.dart';
import 'package:eduit/app/modules/utang_terkini/views/utang_terkini_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/utang_apbn_controller.dart';

class UtangApbnNextView extends GetView<UtangApbnController> {
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
                  'Apa Saja Jenis',
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
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Terdapat 2 jenis utang negara, yaitu pinjaman dan Surat Berharga Negara (SBN).',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        fontSize: 14, color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isExpanded.isTrue) {
                      controller.isExpanded.value = false;
                      print('awal true');
                    } else if (controller.isExpanded.isFalse) {
                      controller.isExpanded.value = true;
                      print('awal false');
                    } else {
                      controller.isExpanded.isTrue;
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Pinjaman',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff034779)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Pembiayaan melalui utang yang diperoleh Pemerintah dari Pemberi Pinjaman Dalam Negeri atau Luar Negeri yang diikat oleh suatu perjanjian pinjaman dan tidak berbentuk surat berharga negara, serta harus dibayar kembali dengan persyaratan tertentu.',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(height: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: controller.isExpanded.isTrue ? 500 : 1,
                    width: double.infinity,
                    child: Container(
                      height: 500,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      //color: Colors.purple,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/pinjaman1.png',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isExpanded2.isTrue) {
                      controller.isExpanded2.value = false;
                      print('awal true');
                    } else if (controller.isExpanded2.isFalse) {
                      controller.isExpanded2.value = true;
                      print('awal false');
                    } else {
                      controller.isExpanded2.isTrue;
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      children: [
                        Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Surat Berharga Negara',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff034779)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Center(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Produk investasi yang diterbitkan dan dijamin oleh pemerintah Republik Indonesia, yang dapat dibeli secara ritel (perorangan) atau organisasi/perusahaan, dan terbit dalam bentuk rupiah dan valuta asing (Valas).',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(height: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: controller.isExpanded2.isTrue ? 750 : 1,
                    width: double.infinity,
                    child: Container(
                      height: 750,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      //color: Colors.purple,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/pinjaman2.png',
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Penasaran dengan apa saja hasil dari utang negara Indonesia? Ayo kita temukan jawabannya!',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(color: Color(0xff656464)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5EE8D1),
                          shape: StadiumBorder()),
                      child: Text(
                        'Lanjut Belajar',
                        style: GoogleFonts.inter(
                            fontSize: 12, color: Colors.white),
                      ),
                      onPressed: () async {
                        await PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: UtangApbnNext2View(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation: PageTransitionAnimation.fade,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
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
