import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tentang Eduit',
                      style: GoogleFonts.inter(
                          color: Color(0xff034779),
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/about1.png',
                  ),
                ),
                Image.asset('assets/images/about2.png'),
                SizedBox(
                  height: 20,
                ),
                Image.asset('assets/images/abou3.png'),
                Image.asset('assets/images/about4.png'),
                Image.asset('assets/images/about5.png'),
                Image.asset('assets/images/about7.png'),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 200,
                  child: Text(
                    'Gimana, banyak kan manfaatnya. Kamu bisa belajar tentang literasi keuangan di ',
                    style: GoogleFonts.inter(
                        color: Color(0xff034779),
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset('assets/images/aboutlast.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
