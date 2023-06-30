import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KalkulatorDuitController extends GetxController {
  TextEditingController initialInvestmentController = TextEditingController();
  TextEditingController investmentDurationController = TextEditingController();
  TextEditingController monthlyInvestmentController = TextEditingController();
  // TextEditingController interestRateController = TextEditingController();
  TextEditingController taxRateController = TextEditingController();
  double? interestRate;
  var hasil;
  RxInt perkiraan = 0.obs;

  RxString? onselectedValue = ''.obs;
  void onItemSelected(String value) {
    onselectedValue = value.obs;

    if (onselectedValue?.value == 'Reksadana Saham') {
      interestRate = 0.14;
    } else if (onselectedValue?.value == 'Reksadana Campuran') {
      interestRate = 0.09;
    } else if (onselectedValue?.value == 'Reksadana Pendapatan Tetap') {
      interestRate = 0.08;
    } else if (onselectedValue?.value == 'Reksadana Pasar Uang') {
      interestRate = 0.06;
    } else if (onselectedValue?.value == 'Emas') {
      interestRate = 0.05;
    } else if (onselectedValue?.value == 'Surat Berharga Negara') {
      interestRate = 0.065;
    } else if (onselectedValue?.value == 'Deposito') {
      interestRate = 0.04;
    } else {
      interestRate = 0;
    }
    final b = (interestRate! * 100).round();
    perkiraan.value = b;
    print('perkiraan $b');
  }

  final List<String> items = [
    'Reksadana Saham',
    'Reksadana Campuran',
    'Reksadana Pendapatan Tetap',
    'Reksadana Pasar Uang',
    'Emas',
    'Surat Berharga Negara',
    'Deposito',
  ];

  void calculateInvestmentResult() {
    double initialInvestment =
        double.parse(initialInvestmentController.text.replaceAll(',', ''));
    double monthlyInvestment =
        double.parse(monthlyInvestmentController.text.replaceAll(',', ''));
    double annualInterestRate = (interestRate! / 100) / 12;
    int investmentDurationMonths =
        int.parse(investmentDurationController.text) * 12;

    double growth = 0;
    double totalgrowth = 0;
    double currentInvestment = initialInvestment;

    // var total = (currentInvestment + monthlyInvestment) *
    //     annualInterestRate *
    //     (100 / 100 - taxRate);

    for (int i = 0; i <= investmentDurationMonths; i++) {
      growth = currentInvestment * annualInterestRate * (1 - 0.09);
      totalgrowth += growth;
      currentInvestment += growth + monthlyInvestment;
    }
    print('initial $initialInvestment');
    print('monthly $monthlyInvestment');
    print('duration $investmentDurationMonths');
    print('anual $annualInterestRate');
    print('taxRate $interestRate');
    print('-----');
    print('current $currentInvestment');
    print('total pertambahan $totalgrowth');
    print('growth $growth');
    String formattedValue = currentInvestment.toStringAsFixed(0);
    hasil = NumberFormat.decimalPattern().format(int.parse(formattedValue));
  }
}
