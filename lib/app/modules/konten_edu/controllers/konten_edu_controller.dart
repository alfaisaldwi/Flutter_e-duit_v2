import 'dart:io';
import 'package:flutter_share/flutter_share.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

class KontenEduController extends GetxController {
  final CollectionReference dbKonten =
      FirebaseFirestore.instance.collection('konten');
  final CollectionReference dbProfile =
      FirebaseFirestore.instance.collection('profile');
  Stream qSnapShot =
      FirebaseFirestore.instance.collection('konten').snapshots();
  RxInt likeCount = 0.obs;
  var liked = [];
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<DocumentSnapshot> documents = <DocumentSnapshot>[].obs;

  Future<void> getData() async {
    try {
      final querySnapshot = await _firestore.collection('konten').get();
      documents.value = querySnapshot.docs;
    } catch (e) {
      print('Error: $e');
    }
  }

  void getLikeCount(docUid) async {
    // Mengambil jumlah like dari Firestore
    final DocumentSnapshot doc =
        await FirebaseFirestore.instance.collection('konten').doc(docUid).get();

    // Mengupdate jumlah like menggunakan nilai dari Firestore
    likeCount.value = (doc.data() as Map<String, dynamic>)['likes'] as int;
  }

  List<CarouselItem> itemList = [
    CarouselItem(
      image: AssetImage('assets/images/thumbnail1.png'),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title:
          'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: AssetImage('assets/images/thumbnail2.png'),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: AssetImage('assets/images/thumbnail3.png'),
      title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      onImageTap: (i) {},
    )
  ];

  Future<String> downloadImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    final directory = await getTemporaryDirectory();
    final path = '${directory.path}/image.jpg';
    final file = File(path);
    await file.writeAsBytes(response.bodyBytes);
    return path;
  }

  void shareImage(String imagePath, String title) async {
    await FlutterShare.shareFile(
      text: title,
      title: title,
      filePath: imagePath,
    );
  }

  @override
  void onInit() {
    // super.onInit();
  }


}
