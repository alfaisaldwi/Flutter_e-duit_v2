import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class NavbarPageController extends GetxController {
  var tabIndex = 0.obs;
  Rx<bool>? isSelected;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? user;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // FirebaseAuth auth = FirebaseAuth.instance;
  // Future<User?> signIn(String email, String password) async {
  //   try {
  //     UserCredential result = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //     return user;
  //   } catch (e) {
  //     log(e.toString());
  //     return null;
  //   }
  // }

  // Stream<User?> get firebaseUserStream => auth.authStateChanges();
  // void asignOutUser() {
  //   auth.signOut();
  // }

}
