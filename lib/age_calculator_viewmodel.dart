import 'package:flutter/foundation.dart';

class AgeCalculatorViewModel extends ChangeNotifier {
  DateTime? _birthDate;
  String _message = '';

  DateTime? get birthDate => _birthDate;
  String get message => _message;

  void setBirthDate(DateTime birthDate) {
    _birthDate = birthDate;
    notifyListeners();
  }

  void setMessage(String message) {
    _message = message;
    notifyListeners();
  }
}
