import 'package:get/get.dart';

import 'package:eduit/app/modules/account_info/bindings/account_info_binding.dart';
import 'package:eduit/app/modules/account_info/views/account_info_view.dart';
import 'package:eduit/app/modules/account_page/bindings/account_page_binding.dart';
import 'package:eduit/app/modules/account_page/views/account_page_view.dart';
import 'package:eduit/app/modules/artikel_podcast/bindings/artikel_podcast_binding.dart';
import 'package:eduit/app/modules/artikel_podcast/views/artikel_podcast_view.dart';
import 'package:eduit/app/modules/daftar_ymyb/bindings/daftar_ymyb_binding.dart';
import 'package:eduit/app/modules/daftar_ymyb/views/daftar_ymyb_view.dart';
import 'package:eduit/app/modules/game_quiz/bindings/game_quiz_binding.dart';
import 'package:eduit/app/modules/game_quiz/views/game_quiz_view.dart';
import 'package:eduit/app/modules/home/bindings/home_binding.dart';
import 'package:eduit/app/modules/home/views/home_view.dart';
import 'package:eduit/app/modules/home_page/bindings/home_page_binding.dart';
import 'package:eduit/app/modules/home_page/views/home_page_view.dart';
import 'package:eduit/app/modules/kalkulator_duit/bindings/kalkulator_duit_binding.dart';
import 'package:eduit/app/modules/kalkulator_duit/views/kalkulator_duit_view.dart';
import 'package:eduit/app/modules/kamus_keuangan_page/bindings/kamus_keuangan_page_binding.dart';
import 'package:eduit/app/modules/kamus_keuangan_page/views/kamus_keuangan_page_view.dart';
import 'package:eduit/app/modules/kirim_tulisan/bindings/kirim_tulisan_binding.dart';
import 'package:eduit/app/modules/kirim_tulisan/views/kirim_tulisan_view.dart';
import 'package:eduit/app/modules/konsultasi/bindings/konsultasi_binding.dart';
import 'package:eduit/app/modules/konsultasi/views/konsultasi_view.dart';
import 'package:eduit/app/modules/konten_edu/bindings/konten_edu_binding.dart';
import 'package:eduit/app/modules/konten_edu/views/konten_edu_view.dart';
import 'package:eduit/app/modules/login_page/bindings/login_page_binding.dart';
import 'package:eduit/app/modules/login_page/controllers/login_page_controller.dart';
import 'package:eduit/app/modules/login_page/views/login_page_view.dart';
import 'package:eduit/app/modules/navbar_page/bindings/navbar_page_binding.dart';
import 'package:eduit/app/modules/navbar_page/views/navbar_page_view.dart';
import 'package:eduit/app/modules/signup_page/bindings/signup_page_binding.dart';
import 'package:eduit/app/modules/signup_page/views/signup_page_view.dart';
import 'package:eduit/app/modules/utang_apbn/bindings/utang_apbn_binding.dart';
import 'package:eduit/app/modules/utang_apbn/views/utang_apbn_view.dart';
import 'package:eduit/app/modules/utang_belajar/bindings/utang_belajar_binding.dart';
import 'package:eduit/app/modules/utang_belajar/views/utang_belajar_view.dart';
import 'package:eduit/app/modules/utang_home/bindings/utang_home_binding.dart';
import 'package:eduit/app/modules/utang_home/views/utang_home_view.dart';
import 'package:eduit/app/modules/utang_terkini/bindings/utang_terkini_binding.dart';
import 'package:eduit/app/modules/utang_terkini/views/utang_terkini_view.dart';
import 'package:eduit/app/navbottom.dart';
import 'package:eduit/splash_binding.dart';
import 'package:eduit/splashscreen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  final LoginPageController landingPageController =
      Get.put(LoginPageController(), permanent: true);
  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_PAGE,
      page: () => AccountPageView(),
      binding: AccountPageBinding(),
    ),
    GetPage(
      name: _Paths.KIRIM_TULISAN,
      page: () => KirimTulisanView(),
      binding: KirimTulisanBinding(),
    ),
    GetPage(
      name: _Paths.HOME_PAGE,
      page: () => HomePageView(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP_PAGE,
      page: () => SignupPageView(),
      binding: SignupPageBinding(),
    ),
    GetPage(
      name: _Paths.NAVBAR_PAGE,
      page: () => NavbarPageView(),
      binding: NavbarPageBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_INFO,
      page: () => AccountInfoView(),
      binding: AccountInfoBinding(),
    ),
    // GetPage(
    // name: _Paths.NAVBOTTOM,
    // page: () => buildBottomNavigationMenu(Get.context!),
    // ),
    GetPage(
      name: _Paths.KAMUS_KEUANGAN_PAGE,
      page: () => KamusKeuanganPageView(),
      binding: KamusKeuanganPageBinding(),
    ),
    GetPage(
      name: _Paths.ARTIKEL_PODCAST,
      page: () => ArtikelPodcastView(),
      binding: ArtikelPodcastBinding(),
    ),
    GetPage(
      name: _Paths.DAFTAR_YMYB,
      page: () => DaftarYmybView(),
      binding: DaftarYmybBinding(),
    ),
    GetPage(
      name: _Paths.KONSULTASI,
      page: () => KonsultasiView(),
      binding: KonsultasiBinding(),
    ),
    GetPage(
      name: _Paths.KONTEN_EDU,
      page: () => KontenEduView(),
      binding: KontenEduBinding(),
    ),
    GetPage(
      name: _Paths.GAME_QUIZ,
      page: () => GameQuizView(),
      binding: GameQuizBinding(),
    ),
    GetPage(
      name: _Paths.UTANG_HOME,
      page: () => UtangHomeView(),
      binding: UtangHomeBinding(),
    ),
    GetPage(
      name: _Paths.UTANG_BELAJAR,
      page: () => UtangBelajarView(),
      binding: UtangBelajarBinding(),
    ),
    GetPage(
      name: _Paths.UTANG_TERKINI,
      page: () => UtangTerkiniView(),
      binding: UtangTerkiniBinding(),
    ),
    GetPage(
      name: _Paths.UTANG_APBN,
      page: () => UtangApbnView(),
      binding: UtangApbnBinding(),
    ),
    GetPage(
      name: _Paths.KALKULATOR_DUIT,
      page: () => KalkulatorDuitView(),
      binding: KalkulatorDuitBinding(),
    ),
  ];
}
