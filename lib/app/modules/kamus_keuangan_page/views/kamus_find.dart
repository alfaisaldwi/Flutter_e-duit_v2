import 'package:eduit/app/data/list_kamus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/kamus_keuangan_page_controller.dart';

class KamusFind extends GetView<KamusKeuanganPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25, top: 120),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Kamus Keuangan.',
                    style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff034779)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '---Search---',
                    style: GoogleFonts.inter(
                        fontSize: 18, color: Color(0xff034779)),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: kamusData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Table(
                          children: [
                            TableRow(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "${kamusData[index].kata}",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  "${kamusData[index].arti}",
                                  style: TextStyle(fontSize: 15.0),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
