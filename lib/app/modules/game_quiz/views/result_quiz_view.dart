import 'dart:io';

import 'package:eduit/app/modules/game_quiz/controllers/game_quiz_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultQuizView extends GetView<GameQuizController> {
  @override
  Widget build(BuildContext context) {
    String? img;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32, top: 50),
            child: Column(children: [
              StreamBuilder(
                stream: controller.streamUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  Map<String, dynamic> dataResult = snapshot.data!.data()!;
                  if (dataResult['nilai'] == 'Konservatif') {
                    img = 'assets/images/konservatif_logo.png';
                    return Column(
                      children: [
                        Container(
                          height: 340,
                          width: 350,
                          //color: Colors.purple,
                          padding: EdgeInsets.all(
                            12,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            img!,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kamu adalah investor',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              'Konservatif',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(
                                  fontSize: 32,
                                  letterSpacing: 4,
                                  color: Color(0xff034779),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 05,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Menghindari risiko dalam berinvestasi adalah salah satu hal yang menjadi fokus kamu sebagai investor konservatif saat memilih produk investasi.',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Kamu bisa memilih deposito, properti, emas, SBN Ritel, Reksadana Pendapatan Tetap dan Reksadana Pasar Uang. ',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Sebab produk tersebut memiliki nilai kenaikan yang cenderung stabil, tidak fluktuatif (berubah-ubah), namun terjamin keamanannya.  ',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 170,
                          child: Builder(builder: (context) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff5EE8D1),
                                    shape: StadiumBorder()),
                                child: Text(
                                  'Bagikan',
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: Colors.white),
                                ),
                                onPressed: () async {
                                  final bytes = await rootBundle
                                      .load('assets/images/kamu_konserv.png');
                                  final list = bytes.buffer.asUint8List();

                                  final tempDir = await getTemporaryDirectory();
                                  final file =
                                      await File('${tempDir.path}/image.jpg')
                                          .create();
                                  file.writeAsBytesSync(list);
                                  Share.shareXFiles([XFile(file.path)],
                                      text:
                                          'Saya adalah seorang Investor tipe Konservatif, Ayo mainkan Game ini untuk mengetahui tipe Investormu!');
                                });
                          }),
                        ),
                      ],
                    );
                  } else if (dataResult['nilai'] == 'Moderat') {
                    img = 'assets/images/moderat_logo.png';
                    return Column(
                      children: [
                        Container(
                          height: 340,
                          width: 350,
                          //color: Colors.purple,
                          padding: EdgeInsets.all(
                            12,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            img!,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kamu adalah investor',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              'Moderat',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(
                                  fontSize: 32,
                                  letterSpacing: 4,
                                  color: Color(0xff034779),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 05,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Investor moderat adalah tipe investor yang mampu menoleransi sebagian risiko penurunan nilai dari produk investasi. ',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Namun mengharapkan tingkat keuntungan yang tidak terlalu sedikit jika dibandingkan dengan investor konservatif.',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Pilihan produk investasi yang bisa kamu plih sebagai investor moderat adalah Reksadana Campuran dan Saham Blue Chip (LQ45).',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 170,
                          child: Builder(builder: (context) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff5EE8D1),
                                    shape: StadiumBorder()),
                                child: Text(
                                  'Bagikan',
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: Colors.white),
                                ),
                                onPressed: () async {
                                  final bytes = await rootBundle
                                      .load('assets/images/kamu_moderat.png');
                                  final list = bytes.buffer.asUint8List();

                                  final tempDir = await getTemporaryDirectory();
                                  final file =
                                      await File('${tempDir.path}/image.jpg')
                                          .create();
                                  file.writeAsBytesSync(list);
                                  Share.shareXFiles([XFile(file.path)],
                                      text:
                                          'Saya adalah seorang Investor tipe Moderat, Ayo mainkan Game ini untuk mengetahui tipe Investormu!');
                                });
                          }),
                        ),
                      ],
                    );
                  } else {
                    img = 'assets/images/agresif_logo.png';
                    return Column(
                      children: [
                        Container(
                          height: 340,
                          width: 350,
                          //color: Colors.purple,
                          padding: EdgeInsets.all(
                            12,
                          ),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            img!,
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Kamu adalah investor',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              'Agresif',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.inter(
                                  fontSize: 32,
                                  letterSpacing: 4,
                                  color: Color(0xff034779),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 05,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Tipe investor yang memiliki keberanian paling tinggi adalah investor agresif. Kamu yakin dan berani mengambil risiko tinggi dan cukup optimis mendapat keuntungan yang tinggi pula. ',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Sebagai investor agresif, kamu sudah memiliki pengetahuan yang  cukup mengenai analisa perubahan (fluktuasi) harga di pasar saham yang tergolong ekstrim.',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Kamu dapat memilih Saham, Reksadana Saham dan Fintech P2P Lending. ',
                                  textAlign: TextAlign.justify,
                                  style: GoogleFonts.inter(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          width: 170,
                          child: Builder(builder: (context) {
                            return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff5EE8D1),
                                    shape: StadiumBorder()),
                                child: Text(
                                  'Bagikan',
                                  style: GoogleFonts.inter(
                                      fontSize: 12, color: Colors.white),
                                ),
                                onPressed: () async {
                                  final bytes = await rootBundle
                                      .load('assets/images/kamu_agresif.png');
                                  final list = bytes.buffer.asUint8List();

                                  final tempDir = await getTemporaryDirectory();
                                  final file =
                                      await File('${tempDir.path}/image.jpg')
                                          .create();
                                  file.writeAsBytesSync(list);
                                  Share.shareXFiles([XFile(file.path)],
                                      text:
                                          'Saya adalah seorang Investor tipe Agresif, Ayo mainkan Game ini untuk mengetahui tipe Investormu!');
                                });
                          }),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(
                height: 7,
              ),
              SizedBox(
                height: 50,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
