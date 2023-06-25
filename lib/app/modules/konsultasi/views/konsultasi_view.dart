import 'package:eduit/app/data/konsul_list.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/konsultasi_controller.dart';

class KonsultasiView extends GetView<KonsultasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 70),
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Perencanaan Keuangan',
                  style: GoogleFonts.inter(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff034779)),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: konsulData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 125,
                      padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                      width: double.infinity,
                      child: Row(children: [
                        Image.asset('assets/images/konsul_logo.png',
                            width: 120),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 3.0, right: 4.0, bottom: 4.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${konsulData[index].nama}',
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 28,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Perencana Keuangan',
                                      style: GoogleFonts.inter(fontSize: 12),
                                    ),
                                    Container(
                                      width: 90,
                                      height: 30,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.white,
                                            shape: StadiumBorder(
                                                side: BorderSide(
                                                    width: 2,
                                                    color: Color(0xffF8C800)))),
                                        child: Text(
                                          'Chat',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                        onPressed: () async {
                                          try {
                                            final Uri _url = Uri.parse(
                                                'https://wa.me/${konsulData[index].nowa}?text=Haloo Pak/Bu, Saya ingin konsultasi masalah perencanaan keuangan. "');
                                            await launchUrl(_url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } catch (err) {
                                            debugPrint(
                                                'Something bad happened');
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    );
                  }),
              SizedBox(
                height: 40,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
