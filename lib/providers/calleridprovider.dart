import 'package:flutter/material.dart';

class CallerIDProvider with ChangeNotifier {
  String _callerID;

  CallerIDProvider(this._callerID);

  String get callerID => _callerID;

  void updateCallerID(String newCallerID) {
    _callerID = newCallerID;
    notifyListeners();
  }
}
