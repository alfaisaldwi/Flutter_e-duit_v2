import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KirimTulisanController extends GetxController {
  TextEditingController cJudul = TextEditingController();
  TextEditingController cIsi = TextEditingController();
  TextEditingController cImg = TextEditingController();
  RxBool isUploaded = false.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference dbKonten =
      FirebaseFirestore.instance.collection('konten');
  // final CollectionReference dbProfile = FirebaseFirestore.instance
  //     .collection('profile')
  //   ..where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  var name = '';

  String formatDate = DateFormat.yMd().format(DateTime.now());

  Stream qSnapShot =
      FirebaseFirestore.instance.collection('konten').snapshots();

  Stream qSnapShot2 =
      FirebaseFirestore.instance.collection('profile').snapshots();

  @override
  void onInit() {
    if (FirebaseAuth.instance.currentUser == null) {
      print(FirebaseAuth.instance.currentUser);
    } else {
      FirebaseFirestore.instance
          .collection("profile")
          .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .listen((data) {
        data.docs.forEach((doc) {
          name = doc.data()['username'];
          super.onInit();
        });
      });
    }
  }

  postTulisan() async {
  var uid = FirebaseAuth.instance.currentUser!.uid;

    final String judul = cJudul.text;
    final String isi = cJudul.text;
    final String img = cImg.text;

    if (judul.isNotEmpty && isi.isNotEmpty && img.isNotEmpty) {
      await dbKonten.add({
        "penulis": name,
        "judul": judul,
        "isi": isi,
        "imgUrl": img,
        "tanggal": formatDate,
        "poin": 10,
        "likes": 0,
      });
      firestore.collection("profile").doc(uid).update({
        "poin": FieldValue.increment(10),
        "tulisan": FieldValue.increment(1)
      });
    }
  }
}
