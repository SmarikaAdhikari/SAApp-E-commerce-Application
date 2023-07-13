import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpansionStateNotifier extends StateNotifier<String> {
  ExpansionStateNotifier() : super("choose");

  //set string
  void setPayment(String payment) {
    print("gayo");
    state = state;
  }
}

// do uing change notifier
class PaymentNotifier extends ChangeNotifier {
  String _payment = "choose";

  String get payment => _payment;

  void setPayment(String payment) {
    _payment = payment;
    notifyListeners();
  }
}

final paymentProvider = ChangeNotifierProvider((ref) => PaymentNotifier());
