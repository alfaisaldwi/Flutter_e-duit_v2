import 'dart:developer';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LoginPageController extends GetxController {
  var tabIndex = 1.obs;

  TextEditingController c_email = TextEditingController();
  TextEditingController c_pw = TextEditingController();
  final count = 0.obs;
  User? user;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
