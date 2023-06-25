import 'package:eduit/app/modules/utang_apbn/views/utang_apbn_view.dart';
import 'package:eduit/app/modules/utang_terkini/views/utang_terkini_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/utang_belajar_controller.dart';

class UtangBelajarView extends GetView<UtangBelajarController> {
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
                  'Mengapa Indonesia',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(fontSize: 24, color: Colors.black),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'Berutang ?',
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
                    'Utang diperlukan agar pemerintah bisa memenuhi kebutuhan yang penting dan mendesak. Salah satu contohnya adalah saat pandemi COVID19 melanda Indonesia, pemerintah harus segera melakukan penanganan agar negara kita bisa melewati pandemi, tetap membangun infrastruktur dan tidak terpuruk secara ekonomi.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        fontSize: 14, color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'Ada 4 poin penting dari perlunya Indonesia untuk berutang, yaitu:',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        fontSize: 14, color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                  child: Container(
                    height: 88,
                    width: double.infinity,
                    padding: EdgeInsets.all(6),
                    //color: Colors.purple,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/belajar1.png',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Obx(() => AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      height: controller.isExpanded.isTrue ? 100 : 1,
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 10),
                          child: Text(
                            'Adanya kebutuhan belanja yang tidak bisa ditunda, misalnya penyediaan fasilitas kesehatan, pendidikan, perlindungan sosial dan ketahanan pangan. Pembiayaan pada pembangunan infrastruktur juga menjadi fokus pemerintah dengan harapan Indeks Pembangunan Manusia (IPM) meningkat dan setara dengan negara-negara maju kedepannya.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Color(0xff034779)),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15,
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
                  child: Container(
                    height: 88,
                    width: double.infinity,
                    padding: EdgeInsets.all(6),
                    //color: Colors.purple,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/belajar2.png',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Obx(() => AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      height: controller.isExpanded2.isTrue ? 100 : 1,
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 10),
                          child: Text(
                            'Legacy atau warisan yang baik muncul ketika utang digunakan untuk membiayai hal-hal yang produktif dan memberikan manfaat bagi generasi mendatang, seperti belanja pembangunan infrastruktur, kesehatan dan pendidikan. Serta dapat memberikan keadilan dengan adanya aset yang diwariskan kepada generasi selanjutnya.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Color(0xff034779)),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isExpanded3.isTrue) {
                      controller.isExpanded3.value = false;
                      print('awal true');
                    } else if (controller.isExpanded3.isFalse) {
                      controller.isExpanded3.value = true;
                      print('awal false');
                    } else {
                      controller.isExpanded3.isTrue;
                    }
                  },
                  child: Container(
                    height: 88,
                    width: double.infinity,
                    padding: EdgeInsets.all(6),
                    //color: Colors.purple,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/belajar3.png',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Obx(() => AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      height: controller.isExpanded3.isTrue ? 100 : 1,
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 10),
                          child: Text(
                            'Dengan kebijakan berutang, ekonomi Indonesia mampu tumbuh pada level saat ini. Sebagai contoh, jika pembangunan jembatan di tahun 3020 senilai Rp250miliar ditunda hingga Indonesia memiliki dana tersebut ditahun 2023, biaya pembangunan jembatan tersebut tidak lagi sama seperti tahun 2020, akan ada kenaikan harga baik dari bahan baku dan jasa, maka pemerintah mengambil kebijakan berutang untuk mengurangi kenaikan harga dan mempercepat pertumbuhan ekonomi. ',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Color(0xff034779)),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    if (controller.isExpanded4.isTrue) {
                      controller.isExpanded4.value = false;
                      print('awal true');
                    } else if (controller.isExpanded4.isFalse) {
                      controller.isExpanded4.value = true;
                      print('awal false');
                    } else {
                      controller.isExpanded4.isTrue;
                    }
                  },
                  child: Container(
                    height: 88,
                    width: double.infinity,
                    padding: EdgeInsets.all(6),
                    //color: Colors.purple,
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/images/belajar4.png',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Obx(() => AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                      height: controller.isExpanded4.isTrue ? 100 : 1,
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 10),
                          child: Text(
                            'Indonesia memilik instrumen utang Pemerintah yang diperdagangkan di pasar keuangan, yang digunakan sebagai acuan (benchmark) bagi industri keuangan. Penerbitan instrumen utang Pemerintah merupakan alternatif investasi yang ditawarkan kepada masyarakat.',
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inter(
                                fontSize: 14, color: Color(0xff034779)),
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Kita sudah membahas mengapa pemerintah berutang, lalu kenapa utang masuk ke dalam APBN? Yuk kita cari tahu!',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        fontSize: 14, color: Color(0xff034779)),
                  ),
                ),
                SizedBox(
                  height: 25,
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
                          screen: UtangApbnView(),
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
