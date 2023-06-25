import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:eduit/app/data/kamusModel.dart';
import 'package:eduit/app/data/list_kamus.dart';
import 'package:eduit/app/modules/artikel_podcast/controllers/artikel_podcast_controller.dart';
import 'package:eduit/app/modules/artikel_podcast/views/artikel_podcast_view.dart';
import 'package:eduit/app/modules/daftar_ymyb/views/daftar_ymyb_view.dart';
import 'package:eduit/app/modules/game_quiz/views/game_quiz_view.dart';
import 'package:eduit/app/modules/kamus_keuangan_page/controllers/kamus_keuangan_page_controller.dart';
import 'package:eduit/app/modules/kamus_keuangan_page/views/kamus_find.dart';
import 'package:eduit/app/modules/kamus_keuangan_page/views/kamus_keuangan_page_view.dart';
import 'package:eduit/app/modules/konsultasi/views/konsultasi_view.dart';
import 'package:eduit/app/modules/konten_edu/views/konten_edu_view.dart';
import 'package:eduit/app/modules/utang_home/views/utang_home_view.dart';
import 'package:eduit/app/navbottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../controllers/home_page_controller.dart';

class HomePageView extends GetView<HomePageController> {
  @override
  Widget build(BuildContext context) {
    Get.put(KamusKeuanganPageController);
    var cSearch = KamusKeuanganPageController();
    return Scaffold(
      // bottomNavigationBar: Nammm()
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14, top: 20),
            child: Column(
              children: [
                Column(
                  children: [
                    AnimSearchBar(
                      boxShadow: true,
                      rtl: true,
                      width: 400,
                      helpText: 'Cari..',
                      color: Color(0xffF8C800),
                      textController: controller.tsearch,
                      onSuffixTap: () {
                        controller.tsearch.clear();
                      },
                      onSubmitted: (query) {
                        showSearch(
                            context: context,
                            delegate: searchSuggest(),
                            query: query);
                        // cSearch.filterDic(value);
                        // // Get.to(() => KamusKeuanganPageView(), arguments: value);
                        // print(value);
                      },
                    ),
                    GestureDetector(
                      onTap: (() async {
                          await PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: GameQuizView(),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );

                        
                      }),
                      child: Container(
                        height: 180,
                        width: double.infinity,
                        padding: EdgeInsets.all(
                          3,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff5EE8D1), width: 2),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Image.asset(
                          'assets/images/home_kuis.png',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    GestureDetector(
                      onTap: () async {
                        await PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: KonsultasiView(),
                          withNavBar: true, // OPTIONAL VALUE. True by default.
                          pageTransitionAnimation:
                              PageTransitionAnimation.cupertino,
                        );
                      },
                      child: Container(
                        height: 100,
                        width: double.infinity,
                        //color: Colors.purple,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff5EE8D1), width: 2),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Image.asset(
                          'assets/images/home_konsul.png',
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                           

                            await PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              settings: RouteSettings(
                                  arguments: ArtikelPodcastController),
                              context,
                              screen: KontenEduView(),
                              withNavBar:
                                  true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                            height: 110,
                            width: 175,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff5EE8D1), width: 2),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Image.asset(
                              'assets/images/home_konten.png',
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: KamusKeuanganPageView(),
                              withNavBar:
                                  true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                            height: 110,
                            width: 175,
                            //color: Colors.purple,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff5EE8D1), width: 2),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Image.asset(
                              'assets/images/home_kamus.png',
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await PersistentNavBarNavigator
                                .pushNewScreenWithRouteSettings(
                              settings: RouteSettings(
                                  arguments: ArtikelPodcastController),
                              context,
                              screen: UtangHomeView(),
                              withNavBar:
                                  true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                            height: 110,
                            width: 175,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff5EE8D1), width: 2),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Image.asset(
                              'assets/images/home_utang.png',
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: DaftarYmybView(),
                              withNavBar:
                                  true, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                            height: 110,
                            width: 175,
                            //color: Colors.purple,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff5EE8D1), width: 2),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Image.asset(
                              'assets/images/home_komunitas.png',
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class searchSuggest extends SearchDelegate {
  var cSearch = KamusKeuanganPageController();
  var nf = '';

  @override
  List<Widget>? buildActions(BuildContext context) {}

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return SizedBox(
      height: 20,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggest = kamusData.where((kamus) {
      final kataTitle = kamus.kata!.toLowerCase();
      final input = query.toLowerCase();

      return kataTitle.contains(input);
    }).toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        itemCount: suggest.length,
        itemBuilder: (context, index) {
          final sugg = suggest[index];
          if (sugg.kata!.length <= 1 || suggest.length <= 1) {
            nf = 'Maaf pencarian tidak ditemukan';
            return Text(
              nf,
              style: GoogleFonts.inter(
                  fontSize: 15.0, fontWeight: FontWeight.bold),
            );
          } else {
            return Column(
              children: [
                Table(
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "${sugg.kata}",
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.inter(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "${sugg.arti}",
                            style: GoogleFonts.inter(
                              fontSize: 15.0,
                            ),
                          )),
                    ]),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
