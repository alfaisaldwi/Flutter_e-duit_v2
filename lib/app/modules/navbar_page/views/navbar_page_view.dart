import 'package:eduit/app/modules/about/views/about_view.dart';
import 'package:eduit/app/modules/home_page/views/home_page_view.dart';
import 'package:eduit/app/modules/kalkulator_duit/views/kalkulator_duit_view.dart';
import 'package:eduit/app/modules/navbar_page/controllers/navbar_page_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NavbarPageView extends GetView<NavbarPageController> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  final contr = PersistentTabController(initialIndex: 1);

  List<Widget> _buildScreen() {
    return [
      KalkulatorDuitView(),
      HomePageView(),
      AboutView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navbarItem() {
    return [
      PersistentBottomNavBarItem(
          title: 'Kalkulator Duit',
          icon: Icon(
            Icons.calculate_outlined,
            color: Color.fromRGBO(36, 54, 101, 1.0),
          ),
          activeColorPrimary: Color(0xffF8C800),
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          title: 'Home',
          icon: Icon(
            Icons.home,
            color: Color.fromRGBO(36, 54, 101, 1.0),
          ),
          activeColorPrimary: Color(0xffF8C800),
          inactiveColorPrimary: CupertinoColors.systemGrey),
      PersistentBottomNavBarItem(
          title: 'Tentang Eduit',
          activeColorSecondary: Colors.black,
          icon: Icon(Icons.info_outline_rounded,
              color: Color.fromRGBO(36, 54, 101, 1.0)),
          activeColorPrimary: Color(0xffF8C800),
          inactiveColorPrimary: Colors.grey,
          inactiveColorSecondary: Colors.white),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      Get.context!,
      screens: _buildScreen(),
      items: _navbarItem(),
      stateManagement: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style3,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      controller: contr,
    );
  }
}
