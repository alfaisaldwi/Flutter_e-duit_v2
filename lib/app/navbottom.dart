
import 'package:eduit/app/modules/about/controllers/about_controller.dart';
import 'package:eduit/app/modules/about/views/about_view.dart';
import 'package:eduit/app/modules/home_page/views/home_page_view.dart';
import 'package:eduit/app/modules/kalkulator_duit/views/kalkulator_duit_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final TextStyle unselectedLabelStyle = TextStyle(
    color: Colors.white.withOpacity(0.5),
    fontWeight: FontWeight.w500,
    fontSize: 12);

final TextStyle selectedLabelStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

Widget buildBottomNavigationMenu(context, landingPageController) {
  return Obx(() => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: SizedBox(
        height: 54,
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: landingPageController.changeTabIndex,
          currentIndex: landingPageController.tabIndex.value,
          backgroundColor: Colors.white,
          unselectedItemColor: Color.fromRGBO(36, 54, 101, 1.0),
          selectedItemColor: Colors.yellow,
          unselectedLabelStyle: unselectedLabelStyle,
          selectedLabelStyle: selectedLabelStyle,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Icon(
                  Icons.border_color_rounded,
                  size: 20.0,
                ),
              ),
              label: 'Kirim Tulisan',
              backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Icon(
                  Icons.home,
                  size: 20.0,
                ),
              ),
              label: 'Home',
              backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 20.0,
                ),
              ),
              label: 'Akun',
              backgroundColor: Color.fromRGBO(36, 54, 101, 1.0),
            ),
          ],
        ),
      )));
}

class Nammm extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final AboutController landingPageController =
        Get.put(AboutController(), permanent: true);
    return Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(
        () => IndexedStack(
          index: landingPageController.tabIndex.value,
          children: [
            KalkulatorDuitView(),
            HomePageView(),
            AboutView(),
          ],
        ),
      ),
    );
  }
}
