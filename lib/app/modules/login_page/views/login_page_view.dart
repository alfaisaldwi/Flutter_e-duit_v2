import 'package:eduit/app/modules/account_info/views/account_info_view.dart';
import 'package:eduit/app/modules/account_page/views/account_page_view.dart';
import 'package:eduit/app/modules/home/views/home_view.dart';
import 'package:eduit/app/modules/home_page/views/home_page_view.dart';
import 'package:eduit/app/modules/kirim_tulisan/views/kirim_tulisan_view.dart';
import 'package:eduit/app/modules/signup_page/views/signup_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavBottom(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              padding:
                  EdgeInsets.only(top: 85, left: 40, right: 50, bottom: 20),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 80),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Halo.',
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff034779)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Silahkan login jika anda sudah memiliki akun',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: controller.c_email,
                decoration: InputDecoration(
                  hintText: 'Email',
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: controller.c_pw,
                decoration: InputDecoration(
                  hintText: 'Password',
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 80,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5EE8D1),
                      shape: StadiumBorder()),
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.black),
                  ),
                  onPressed: () async {
                    await controller.signIn(
                        controller.c_email.text, controller.c_pw.text);
                    if (FirebaseAuth.instance.currentUser?.uid != null) {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: AccountInfoView(),
                        withNavBar: true, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Periksa Email&Password'),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'))
                                ],
                              ));

                      // shape: RoundedRectangleBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      // color: Color(0xFF4f4f4f),
                      // elevation: 0,
                      // padding: EdgeInsets.symmetric(vertical: 16),
                    }
                  }),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Belum mempunyai akun?',
              style: GoogleFonts.inter(),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 100,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffF8C800), shape: StadiumBorder()),
                child: Text(
                  'Buat akun',
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.black),
                ),
                onPressed: () async {
                  await PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: SignupPageView(),
                    withNavBar: true, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                  Get.toNamed('signup-page');
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
