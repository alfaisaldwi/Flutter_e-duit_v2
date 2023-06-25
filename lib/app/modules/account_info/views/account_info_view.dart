import 'package:eduit/app/modules/account_page/views/account_page_view.dart';
import 'package:eduit/app/modules/game_quiz/views/game_quiz_view.dart';
import 'package:eduit/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:eduit/app/modules/navbar_page/views/navbar_page_view.dart';
import 'package:eduit/app/navbottom.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/account_info_controller.dart';

class AccountInfoView extends GetView<AccountInfoController> {
  final pUser = Get.put(LoginPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: NavbarPageView(),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 100),
          child: StreamBuilder(
              stream: controller.streamUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  var imgP;
                  Map<String, dynamic> dataResult = snapshot.data!.data()!;
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
                              fontSize: 24, color: Color(0xff034779)),
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
                          padding: const EdgeInsets.only(left: 8.0, top: 5),
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
                              await PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: GameQuizView(),
                                withNavBar:
                                    true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
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
                        Container(
                          height: 240,
                          width: double.infinity,
                          //color: Colors.purple,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/kamu_konserv.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      if (dataResult['nilai'] == 'Moderat')
                        Container(
                          height: 240,
                          width: double.infinity,
                          //color: Colors.purple,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/kamu_moderat.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      if (dataResult['nilai'] == 'Agresif')
                        Container(
                          height: 240,
                          width: double.infinity,
                          //color: Colors.purple,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(),
                          child: Image.asset(
                            'assets/images/kamu_agresif.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        fontSize: 16, color: Colors.black45),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text('${dataResult['tulisan'] ?? 0}',
                                      style: GoogleFonts.inter(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87)),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: 167,
                              height: 120,
                              padding: EdgeInsets.all(12),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Poin Kamu',
                                    style: GoogleFonts.inter(
                                        fontSize: 16, color: Colors.black45),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Text('${dataResult['poin'] ?? 0}',
                                      style: GoogleFonts.inter(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
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
                              controller.asignOutUser();
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: AccountPageView(),
                                withNavBar:
                                    true, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            }),
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
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
