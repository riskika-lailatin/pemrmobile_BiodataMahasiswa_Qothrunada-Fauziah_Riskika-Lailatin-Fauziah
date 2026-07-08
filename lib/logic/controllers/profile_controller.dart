import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {

  bool _notification = true;

  bool get notification => _notification;

  String _language = "English";

  String get language => _language;

  //-----------------------------------

  void toggleNotification() {

    _notification = !_notification;

    notifyListeners();

  }

  //-----------------------------------

  void changeLanguage(String value) {

    _language = value;

    notifyListeners();

  }

  //-----------------------------------

  Future<void> logout() async {

    debugPrint("Logout berhasil");

  }

}