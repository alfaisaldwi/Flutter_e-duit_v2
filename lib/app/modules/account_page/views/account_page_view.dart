import 'dart:io';

import 'package:eduit/app/modules/account_info/controllers/account_info_controller.dart';
import 'package:eduit/app/modules/account_info/views/account_info_view.dart';
import 'package:eduit/app/modules/game_quiz/views/game_quiz_view.dart';
import 'package:eduit/app/modules/konten_edu/views/konten_edu_view.dart';
import 'package:eduit/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:eduit/app/modules/login_page/views/login_page_view.dart';
import 'package:eduit/app/modules/signup_page/views/signup_page_view.dart';
import 'package:eduit/app/navbottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/account_page_controller.dart';

class AccountPageView extends GetView<AccountPageController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AccountPageController());
    Get.put(LoginPageController());
    Get.put(AccountInfoController());
    var controllerLgn = LoginPageController();
    var controllerInfo = AccountInfoController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            child: Column(
              children: [
                if (controller.firebaseAuth.currentUser == null)
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              top: 85, left: 40, right: 50, bottom: 20),
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
                            keyboardType: TextInputType.emailAddress,
                            controller: controllerLgn.c_email,
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
                            controller: controllerLgn.c_pw,
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
                                style: GoogleFonts.inter(
                                    fontSize: 12, color: Colors.black),
                              ),
                              onPressed: () async {
                                await controllerLgn.signIn(
                                    controllerLgn.c_email.text,
                                    controllerLgn.c_pw.text);
                                if (FirebaseAuth.instance.currentUser?.uid !=
                                    null) {
                                  Get.offAndToNamed('/navbar-page');
                                  Fluttertoast.showToast(
                                    msg: 'Login Berhasil',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.grey[800],
                                    textColor: Colors.white,
                                    fontSize: 14.0,
                                  );
                                } else {
                                  showDialog(
                                      context: Get.context!,
                                      builder: (context) => AlertDialog(
                                            title: Text('Error'),
                                            content:
                                                Text('Periksa Email&Password'),
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
                                backgroundColor: Color(0xffF8C800),
                                shape: StadiumBorder()),
                            child: Text(
                              'Buat akun',
                              style: GoogleFonts.inter(
                                  fontSize: 12, color: Colors.black),
                            ),
                            onPressed: () async {
                              await PersistentNavBarNavigator.pushNewScreen(
                                Get.context!,
                                screen: SignupPageView(),
                                withNavBar:
                                    true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                              Get.toNamed('signup-page');
                            },
                          ),
                        )
                      ]),
                if (controller.firebaseAuth.currentUser != null)
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, top: 100),
                      child: StreamBuilder(
                          stream: controllerInfo.streamUser(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (snapshot.hasData) {
                              var imgP;
                              Map<String, dynamic> dataResult =
                                  snapshot.data!.data()!;
                              return Column(
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
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '${dataResult['username']}',
                                      style: GoogleFonts.inter(
                                          fontSize: 24,
                                          color: Color(0xff034779)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  if (dataResult['nilai'] == null ||
                                      dataResult['nilai'] == '')
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Kamu tipe investor yang seperti apa?',
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (dataResult['nilai'] == null ||
                                      dataResult['nilai'] == '')
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, top: 5),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Yuk, cek profil risiko kamu dalam berinvestasi!',
                                          style: GoogleFonts.inter(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (dataResult['nilai'] == null ||
                                      dataResult['nilai'] == '')
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await PersistentNavBarNavigator
                                              .pushNewScreen(
                                            context,
                                            screen: GameQuizView(),
                                            withNavBar:
                                                true, // OPTIONAL VALUE. True by default.
                                            pageTransitionAnimation:
                                                PageTransitionAnimation
                                                    .cupertino,
                                          );
                                        },
                                        child: Container(
                                          height: 120,
                                          width: double.infinity,
                                          //color: Colors.purple,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Color(0xff034779),
                                            ),
                                          ),
                                          child: Image.asset(
                                            'assets/images/account_kuis.png',
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (dataResult['nilai'] == 'Konservatif')
                                    GestureDetector(
                                      onTap: () async {
                                        final bytes = await rootBundle.load(
                                            'assets/images/kamu_konserv.png');
                                        final list = bytes.buffer.asUint8List();

                                        final tempDir =
                                            await getTemporaryDirectory();
                                        final file = await File(
                                                '${tempDir.path}/image.jpg')
                                            .create();
                                        file.writeAsBytesSync(list);
                                        Share.shareXFiles([XFile(file.path)],
                                            text:
                                                'Saya adalah seorang Investor tipe Konservatif, Ayo mainkan Game ini untuk mengetahui tipe Investormu!');
                                      },
                                      child: Container(
                                        height: 240,
                                        width: double.infinity,
                                        //color: Colors.purple,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          'assets/images/kamu_konserv.png',
                                          fit: BoxFit.fitWidth,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                  if (dataResult['nilai'] == 'Moderat')
                                    GestureDetector(
                                      onTap: () async {
                                        final bytes = await rootBundle.load(
                                            'assets/images/kamu_moderat.png');
                                        final list = bytes.buffer.asUint8List();

                                        final tempDir =
                                            await getTemporaryDirectory();
                                        final file = await File(
                                                '${tempDir.path}/image.jpg')
                                            .create();
                                        file.writeAsBytesSync(list);
                                        Share.shareXFiles([XFile(file.path)],
                                            text:
                                                'Saya adalah seorang Investor tipe Moderat, Ayo mainkan Game ini untuk mengetahui tipe Investormu!');
                                      },
                                      child: Container(
                                        height: 240,
                                        width: double.infinity,
                                        //color: Colors.purple,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          'assets/images/kamu_moderat.png',
                                          fit: BoxFit.fitWidth,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                  if (dataResult['nilai'] == 'Agresif')
                                    GestureDetector(
                                      onTap: () async {
                                        final bytes = await rootBundle.load(
                                            'assets/images/kamu_agresif.png');
                                        final list = bytes.buffer.asUint8List();

                                        final tempDir =
                                            await getTemporaryDirectory();
                                        final file = await File(
                                                '${tempDir.path}/image.jpg')
                                            .create();
                                        file.writeAsBytesSync(list);
                                        Share.shareXFiles([XFile(file.path)],
                                            text:
                                                'Saya adalah seorang Investor tipe Agresif, Ayo mainkan Game ini untuk mengetahui tipe Investormu!');
                                      },
                                      child: Container(
                                        height: 240,
                                        width: double.infinity,
                                        //color: Colors.purple,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(),
                                        child: Image.asset(
                                          'assets/images/kamu_agresif.png',
                                          fit: BoxFit.fitWidth,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                    ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        child: Container(
                                          width: 167,
                                          height: 120,
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Tulisan Kamu',
                                                style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    color: Colors.black45),
                                              ),
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Text(
                                                  '${dataResult['tulisan'] ?? 0}',
                                                  style: GoogleFonts.inter(
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: Container(
                                          width: 140,
                                          height: 120,
                                          padding: EdgeInsets.all(12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text(
                                                'Poin Kamu',
                                                style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    color: Colors.black45),
                                              ),
                                              SizedBox(
                                                height: 18,
                                              ),
                                              Text(
                                                  '${dataResult['poin'].toString() ?? 0}',
                                                  style: GoogleFonts.inter(
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black87)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 80,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: StadiumBorder(),
                                            side: const BorderSide(
                                              width: 1.5,
                                              color: Color(0xff034779),
                                            )),
                                        child: Text(
                                          'Logout',
                                          style: GoogleFonts.inter(
                                              fontSize: 12,
                                              color: Color(0xff034779),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () async {
                                          controllerInfo.asignOutUser();
                                          Get.offAndToNamed('/navbar-page');
                                          Fluttertoast.showToast(
                                            msg: 'Akun telah logout',
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            backgroundColor: Colors.grey[800],
                                            textColor: Colors.white,
                                            fontSize: 14.0,
                                          );
                                        }),
                                  ),
                                  SizedBox(
                                    height: 200,
                                  ),
                                ],
                              );
                            } else {
                              return Center(
                                child: Text('Tidak dapat memuat user'),
                              );
                            }
                          }),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
