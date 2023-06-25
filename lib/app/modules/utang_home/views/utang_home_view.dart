import 'package:eduit/app/modules/utang_belajar/views/utang_belajar_view.dart';
import 'package:eduit/app/modules/utang_terkini/views/utang_terkini_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/utang_home_controller.dart';

class UtangHomeView extends GetView<UtangHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32, top: 80),
            child: Column(children: [
              Center(
                child: Text(
                  '“Utang Negara untuk Masa Depan Bangsa”',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff034779)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 340,
                width: 250,
                //color: Colors.purple,
                padding: EdgeInsets.all(
                  14,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/images/utang_home.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Mengapa utang bisa menjadi bagian dari masa depan bangsa?',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(fontSize: 14),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Yuk kita kenali lebih dalam lagi tentang utang negara Indonesia!',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.inter(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 170,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5EE8D1),
                      shape: StadiumBorder()),
                  child: Text(
                    'Belajar tentang utang',
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.white),
                  ),
                  onPressed: () async {
                    await PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: UtangBelajarView(),
                      withNavBar: true, // OPTIONAL VALUE. True by default.
                      pageTransitionAnimation: PageTransitionAnimation.fade,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                width: 170,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, shape: StadiumBorder()),
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
