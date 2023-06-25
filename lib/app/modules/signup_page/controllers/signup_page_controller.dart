import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPageController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController c_email = TextEditingController();
  TextEditingController c_pw = TextEditingController();
  TextEditingController c_namalengkap = TextEditingController();
  TextEditingController c_username = TextEditingController();
  TextEditingController c_nohp = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<User?> signUpUser(String email, String password) async {
    try {
      UserCredential result = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      if (result.user != null) {
        String uid = result.user!.uid;

        await firestore.collection("profile").doc(uid).set({
          "email": c_email.text,
          "username": c_username.text,
          "nama": c_namalengkap.text,
          "nohp": c_nohp.text,
          "uid": uid,
          "poin": 0,
          "listliked": ['asdasfasdasdasd'],
          "createdAt": DateTime.now().toIso8601String(),
        });
      }
      User? user = result.user;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Stream<User?> get firebaseUserStream => auth.authStateChanges();
  void asignOutUser() {
    auth.signOut();
  }
}
