import 'package:eduit/app/modules/utang_apbn/views/utang_apbn_next_view.dart';
import 'package:eduit/app/modules/utang_terkini/views/utang_terkini_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/utang_apbn_controller.dart';

class UtangApbnView extends GetView<UtangApbnController> {
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
                  'Apa Hubungan dari',
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.inter(fontSize: 24, color: Colors.black),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'APBN dan Utang ?',
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
                    'Saat Belanja Negara lebih besar dari Pendapatan Negara, dikarenakan pemerintah mengejar kebutuhan belanja yang tidak bisa ditunda seperti penyediaan fasilitas kesehatan, pendidikan, dan infrastruktur. Konsekuensi dari selisih kurang antara pendapatan dan belanja negara adalah defisit APBN. Maka pemerintah mengambil kebijakan berutang.',
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
                    'Struktur APBN',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 410,
                  width: double.infinity,
                  padding: EdgeInsets.all(8),
                  //color: Colors.purple,
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/belajar5.png',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pendapatan Negara dan Hibah',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xff034779)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Pendapatan negara didefinisikan sebagai hak pemerintah pusat yang diakui sebagai penambah aset (nilai kekayaan bersih).',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Belanja Negara',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xff034779)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Seluruh kewajiban Pemerintah Pusat yang diakui sebagai pengurang nilai kekayaan bersih (Pendapatan Negara dan Hibah).',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Surplus/Defisit Anggaran',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xff034779)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Surplus Anggaran merupakan keadaan saat pendapatan negara itu lebih besar dari belanja negara. Defisit Anggaran merupakan suatu keadaan dimana belanja negara itu lebih besar dari pendapatan negara.',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Pembiayaan Negara',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xff034779)),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Penerimaan yang wajib untuk dibayarkan kembali serta juga pengeluaran yang kemudian akan diterima kembali, baik itu ditahun anggaran yang bersangkutan atau pun juga ditahun anggaran berikutnya.',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ]),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Utang ternyata bisa membantu dalam realisasi APBN ya, jenis utang apa ya, yang selama ini digunakan oleh Indonesia?',
                  style: GoogleFonts.inter(color: Color(0xff656464)),
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
                          screen: UtangApbnNextView(),
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
