import 'package:flutter/material.dart';

class NewBookProvider extends ChangeNotifier {
  double val = 0.0;
  String labelValue = 'Unread';
  double progressAmount = 0.0;

  String checkLabel(String val) {
    if (val == '0') {
      labelValue = 'Unread';
      progressAmount = 0;
    } else if (val == '10') {
      labelValue = 'Read';
      progressAmount = 1;
    } else {
      labelValue = 'Reading';
      progressAmount = 0.5;
    }
    notifyListeners();
    return labelValue;
  }

}
