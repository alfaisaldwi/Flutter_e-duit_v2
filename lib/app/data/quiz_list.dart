import 'package:eduit/app/data/kamusModel.dart';
import 'package:eduit/app/data/quiz_model.dart';

List<QuizModel> quizData = [
  QuizModel(1, "Apakah tujuanmu dalam berinvestasi?", [
    'Ingin mengamankan uang, agar tidak boros walau tidak mendapatan keuntungan',
    'Ingin mendapat keuntungan dari investasi meski untuk jangka waktu panjang',
    'Ingin memperoleh keuntungan & pertumbuhan dana investasi secara signifikan'
  ]),
  QuizModel(
      2,
      "Berapa lama waktu yang kamu inginkan untuk mengambil keuntungan dana investasimu?",
      ['Kurang dari 1 tahun', '1 sampai 5 tahun', 'Lebih dari 5 tahun']),
  QuizModel(
      3,
      "Bila nilai pada produk investasi kamu turun sebanyak 20%, apa yang akan kamu lakukan?",
      [
        'Mencairkan seluruh uang yang tersisa',
        'Tidak melakukan apa-apa',
        'Menambahkan uang pada produk investasinya'
      ]),
  QuizModel(
      4,
      "Percayakah kamu kalau semakin besar keuntungan investasi, semakin besar risiko yang harus ditanggung?",
      ['Ya', 'Tidak', 'Mungkin']),
  QuizModel(5, "Seberapa tahukah kamu tentang keuangan atau produk keuangan?",
      ['Belum paham banyak', 'Cukup paham banyak', 'Sudah paham sekali']),
];
