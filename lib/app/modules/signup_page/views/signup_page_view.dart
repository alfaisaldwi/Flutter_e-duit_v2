import 'package:eduit/app/modules/navbar_page/views/navbar_page_view.dart';
import 'package:eduit/app/navbottom.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/signup_page_controller.dart';

class SignupPageView extends GetView<SignupPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavBottom(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Column(children: [
            Container(
              padding:
                  EdgeInsets.only(top: 85, left: 40, right: 50, bottom: 20),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Daftar.',
                      style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff034779)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nama Lengkap',
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: controller.c_namalengkap,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: controller.c_username,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff5EE8D1),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email',
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.c_email,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'No. Handphone',
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.c_nohp,
                decoration: InputDecoration(
                  focusColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: GoogleFonts.inter(fontSize: 12),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                obscureText: true,
                controller: controller.c_pw,
                decoration: InputDecoration(
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
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffF8C800),
                      shape: StadiumBorder()),
                  child: Text(
                    'Buat Akun',
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.black),
                  ),
                  onPressed: () async {
                    if (controller.c_email.text.isNotEmpty &&
                        controller.c_pw.text.isNotEmpty &&
                        controller.c_namalengkap.text.isNotEmpty &&
                        controller.c_username.text.isNotEmpty &&
                        controller.c_nohp.text.isNotEmpty) {
                      await controller.signUpUser(
                          controller.c_email.text, controller.c_pw.text);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Berhasil'),
                                content:
                                    Text('Silahkan Login Untuk Melanjutkan'),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed('/navbar-page');
                                        Fluttertoast.showToast(
                                          msg: 'Selamat akun berhasil dibuat',
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey[800],
                                          textColor: Colors.white,
                                          fontSize: 14.0,
                                        );
                                      },
                                      child: Text('Ok'))
                                ],
                              ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text('Error'),
                                content: Text('Tolong isi semua fieldnya ya..'),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'))
                                ],
                              ));
                    }
                  }),
            ),
            SizedBox(
              height: 40,
            ),
          ]),
        ),
      ),
    );
  }
}
