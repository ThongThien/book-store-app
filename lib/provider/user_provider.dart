import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _role = '';
  String _id = '';

  String get role => _role;
  String get id => _id;

  void setUser(String role, String id) {
    _role = role;
    _id = id;
    notifyListeners();
  }

  void clearUser() {
    _role = '';
    _id = '';
    notifyListeners();
  }
}
