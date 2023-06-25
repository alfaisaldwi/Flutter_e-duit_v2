import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eduit/app/data/quiz_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class GameQuizController extends GetxController {
  RxList isAnswer = [].obs;
  RxList userAnswer = [].obs;
  RxInt indexAnswerNow = 0.obs;
  RxBool isClick = false.obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // final Rx<QuizModel?> dataQuiz = (null as QuizModel?).obs;

  late final Rx<QuizModel> quizData;


  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() async* {
    String uid = await auth.currentUser!.uid;
    yield* firestore.collection("profile").doc(uid).snapshots();
  }

  changeIndexAnswerNow(int paramIndexAnswer) {
    indexAnswerNow.value = paramIndexAnswer;
  }

  addUserAnswer(String paramUserAnswer) {
    userAnswer[indexAnswerNow.value] = paramUserAnswer;

    // isAnswer[indexAnswerNow.value] = true;
  }


  submitAnswer() async {
    String? nilai;
    String uid = auth.currentUser!.uid;
    List konserv = [
      'Ingin mengamankan uang, agar tidak boros walau tidak mendapatan keuntungan',
      'Kurang dari 1 tahun',
      'Mencairkan seluruh uang yang tersisa',
      'Tidak',
      'Belum paham banyak'
    ];

    List moder = [
      'Ingin mendapat keuntungan dari investasi meski untuk jangka waktu panjang',
      '1 sampai 5 tahun',
      'Tidak melakukan apa-apa',
      'Mungkin',
      'Cukup paham banyak',
    ];

    List agres = [
      'Ingin memperoleh keuntungan & pertumbuhan dana investasi secara signifikan',
      'Lebih dari 5 tahun',
      'Menambahkan uang pada produk investasinya',
      'Ya',
      'Sudah paham sekali'
    ];

    List p = userAnswer.expand((jawab) => jawab).toList();
    var firstListSetKonserv = konserv.toSet();
    var firstListSetModer = moder.toSet();
    var firstListSetAgres = agres.toSet();
    var secondListSet = p.toSet();

    if (firstListSetKonserv.intersection(secondListSet).length >= 3) {
      nilai = 'Konservatif';
      print('-----BERHASIL------ $p');
      print(firstListSetKonserv.intersection(secondListSet));
      await firestore.collection("profile").doc(uid).set({
        "nilai": nilai,
      }, SetOptions(merge: true)).then((value) {});
    }

    //MODERAT
    else if (firstListSetModer.intersection(secondListSet).length >= 3) {
      nilai = 'Moderat';
      await firestore.collection("profile").doc(uid).set({
        "nilai": nilai,
      }, SetOptions(merge: true)).then((value) {});
    }

    //AGRESIF
    else if (firstListSetAgres.intersection(secondListSet).length >= 3) {
      nilai = 'Agresif';

      await firestore.collection("profile").doc(uid).set({
        "nilai": nilai,
      }, SetOptions(merge: true)).then((value) {});
    }

    //KONSERV 2
    else if (firstListSetKonserv.intersection(secondListSet).length >= 2) {
      nilai = 'Konservatif';
      print('-----BERHASIL------ $p');
      print(firstListSetKonserv.intersection(secondListSet));
      await firestore.collection("profile").doc(uid).set({
        "nilai": nilai,
      }, SetOptions(merge: true)).then((value) {});
    }

    //MODERAT 2
    else if (firstListSetModer.intersection(secondListSet).length >= 2) {
      nilai = 'Moderat';
      await firestore.collection("profile").doc(uid).set({
        "nilai": nilai,
      }, SetOptions(merge: true)).then((value) {});
    }

    //AGRESIF 2
    else if (firstListSetAgres.intersection(secondListSet).length >= 2) {
      nilai = 'Agresif';

      await firestore.collection("profile").doc(uid).set({
        "nilai": nilai,
      }, SetOptions(merge: true)).then((value) {});
    } else {
      nilai = 'Moderat';

      await firestore.collection("profile").doc(uid).set({
        "nilai": nilai,
      }, SetOptions(merge: true)).then((value) {});

      print('gagal');
      // print(userAnswer);

      print('----------- $p');
    }
  }
}
