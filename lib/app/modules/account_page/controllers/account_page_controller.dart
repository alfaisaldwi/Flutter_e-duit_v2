import 'dart:developer';

import 'package:eduit/app/modules/account_info/views/account_info_view.dart';
import 'package:eduit/app/modules/login_page/views/login_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPageController extends GetxController {
  //TODO: Implement AccountPageController

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController c_email = TextEditingController();
  TextEditingController c_pw = TextEditingController();
  final count = 0.obs;
  var p;
  var isLogin = true.obs;

  FirebaseAuth auth = FirebaseAuth.instance;

  pageW() {
    if (firebaseAuth.currentUser == null && isLogin.value == false) {
      p = LoginPageView();
      
    } else {
      p = AccountInfoView();
    }
    return p;
  }
}
