import 'dart:async';

import 'package:eduit/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () => Get.offAndToNamed(Routes.NAVBAR_PAGE));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          // [Color(0xFFFF800B),Color(0xFFCE1010),]
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  height: 250.0,
                  width: 250.0,
                ),
              ],
            ),
            Column(
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
                SizedBox(
                  height: 90,
                ),
                Text(
                  'Temukan investasi yang',
                  style:
                      GoogleFonts.inter(color: Color(0xff989393), fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('tepat khusus untuk kamu',
                    style: GoogleFonts.inter(
                        color: Color(0xff989393), fontSize: 14)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff5EE8D1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.white,
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(
                      'Disini',
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Color(0xff034779)),
                    ),
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
