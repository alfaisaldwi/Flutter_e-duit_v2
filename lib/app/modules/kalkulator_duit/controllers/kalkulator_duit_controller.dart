import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class KalkulatorDuitController extends GetxController {
  TextEditingController initialInvestmentController = TextEditingController();
  TextEditingController investmentDurationController = TextEditingController();
  TextEditingController monthlyInvestmentController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController taxRateController = TextEditingController();
  double? taxRate;
  var hasil;
  // 9 / 100;

  RxString? onselectedValue = ''.obs;
  void onItemSelected(String value) {
    onselectedValue = value.obs;
    // taxRate = double.parse(taxRateController.text.replaceAll(',', ''));

    if (onselectedValue?.value == 'Reksadana Saham') {
      taxRate = 0.14;
    } else if (onselectedValue?.value == 'Reksadana Campuran') {
      taxRate = 0.09;
    } else if (onselectedValue?.value == 'Reksadana Pendapatan Tetap') {
      taxRate = 0.08;
    } else if (onselectedValue?.value == 'Reksadana Pasar Uang') {
      taxRate = 0.06;
    } else if (onselectedValue?.value == 'Emas') {
      taxRate = 0.05;
    } else if (onselectedValue?.value == 'Surat Berharga Negara') {
      taxRate = 0.065;
    } else if (onselectedValue?.value == 'Deposito') {
      taxRate = 0.04;
    } else {
      taxRate = 333;
    }
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
    double annualInterestRate =
        (double.parse(interestRateController.text) / 100) / 12;
    int investmentDurationMonths =
        int.parse(investmentDurationController.text) * 12;

    double growth = 0;
    double totalgrowth = 0;
    double currentInvestment = initialInvestment;

    // var total = (currentInvestment + monthlyInvestment) *
    //     annualInterestRate *
    //     (100 / 100 - taxRate);

    for (int i = 0; i <= investmentDurationMonths; i++) {
      growth = currentInvestment * annualInterestRate * (1 - taxRate!);
      totalgrowth += growth;
      currentInvestment += growth + monthlyInvestment;
    }
    print('initial $initialInvestment');
    print('monthly $monthlyInvestment');
    print('duration $investmentDurationMonths');
    print('anual $annualInterestRate');
    print('taxRate $taxRate');
    print('-----');
    print('current $currentInvestment');
    print('total pertambahan $totalgrowth');
    print('growth $growth');
    String formattedValue = currentInvestment.toStringAsFixed(0);
    hasil = NumberFormat.decimalPattern().format(int.parse(formattedValue));
  }
}
