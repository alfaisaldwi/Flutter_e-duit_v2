import 'package:eduit/app/modules/account_info/views/account_info_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../controllers/daftar_ymyb_controller.dart';

class DaftarYmybView extends GetView<DaftarYmybController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32, top: 100),
            child: Column(children: [
              Container(
                height: 200,
                width: 200,
                //color: Colors.purple,
                padding: EdgeInsets.all(
                  15,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/ymyb_home.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Komunitas YMYB',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(
                    color: Color(0xff034779),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 230,
                width: double.infinity,
                //color: Colors.purple,
                padding: EdgeInsets.all(
                  3,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/ymyb_head.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Komunitas Yang Muda Yang Bicara (YMYB)   hadir sebagai komunitas anak muda yang dipelopori dan disediakan oleh DJPPR sebagai ruang bertumbuh, bicara dan saling berbagi melalui berbagai aktivitas dan media berkreasi.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Benefit yang bisa kamu dapatkan saat bergabung dalam YMYB adalah:',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 230,
                    width: 270,
                    //color: Colors.purple,
                    padding: EdgeInsets.all(
                      3,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(),
                    child: Image.asset(
                      'assets/images/ymyb_benefit.png',
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '“Yang Muda Yang Bicara” (YMYB) juga menjadi wadah komunitas audiens komunikasi DJPPR dengan masyarakat luas sebagai bentuk pelaksanaan aktivitas komunikasi dan edukasi publik offline yang hadir dalam rangkaian penyelenggaraan InFest.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'InFest by DJPPR merupakan sebuah event tahunan sejak tahun 2019 tentang literasi keuangan yang dihadiran sebagai wadah bagi generasi muda Indonesia.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Selain itu InFest juga hadir sebagai tempat untuk mengembangkan diri dan bersama-sama belajar seputar pengelolaan keuangan dan risiko dalam rangka mewujudkan kultur investasi yang baik.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 270,
                //color: Colors.purple,
                padding: EdgeInsets.all(
                  3,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/ymyb_talkshow.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'InFest Talkshow',
                style: GoogleFonts.inter(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 270,
                //color: Colors.purple,
                padding: EdgeInsets.all(
                  3,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/ymyb_inkubasi.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'InFest Inkubasi',
                style: GoogleFonts.inter(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                width: 270,
                //color: Colors.purple,
                padding: EdgeInsets.all(
                  3,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/ymyb_standup.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'InFest Stand-up Competition',
                style: GoogleFonts.inter(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                '\Serta masih banyak kegiatan lainnya yang bisa kamu ikuti sebagai anggota YMYB. Tunggu apalagi? Yuk segera daftar menjadi anak muda yang melek literasi keuangan!',
                textAlign: TextAlign.justify,
                style: GoogleFonts.inter(fontSize: 12),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 160,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5EE8D1),
                        shape: StadiumBorder()),
                    child: Text(
                      'Daftar Sekarang!',
                      style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      try {
                        final Uri _url = Uri.parse('https://www.djppr.kemenkeu.go.id/registrasi');
                        await launchUrl(_url,
                            mode: LaunchMode.externalApplication);
                      } catch (err) {
                        debugPrint('Something bad happened');
                      }
                    }),
              ),
              SizedBox(
                height: 70,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
