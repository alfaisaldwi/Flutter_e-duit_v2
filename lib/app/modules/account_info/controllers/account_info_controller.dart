import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduit/app/modules/account_page/views/account_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AccountInfoController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<User?> get firebaseUserStream => auth.authStateChanges();
  void asignOutUser() async {
    await auth.signOut();
  }

  Future<User?> getCurrentUser() async {
    return auth.currentUser;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("profile").doc(uid).snapshots();
  }
}
