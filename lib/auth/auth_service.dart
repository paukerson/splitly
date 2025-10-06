import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService with ChangeNotifier {
  String? _token;
  String? _userId;

  String? get token => _token;
  String? get userId => _userId;
  bool get isAuthenticated => token != null;

  Future<void> login(String email, String password) async {
    // Replace with your actual login logic
    // final response = await ApiService().post('login', {'email': email, 'password': password});
    // _token = response['token'];
    // _userId = response['userId'];
    _token = 'fake_token'; // for testing
    _userId = 'fake_user_id'; // for testing
    _saveAuthData();
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    // Replace with your actual signup logic
    // final response = await ApiService().post('signup', {'email': email, 'password': password});
    // _token = response['token'];
    // _userId = response['userId'];
    _token = 'fake_token'; // for testing
    _userId = 'fake_user_id'; // for testing
    _saveAuthData();
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    notifyListeners();
  }

  Future<void> _saveAuthData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = {
      'token': _token,
      'userId': _userId,
    };
    prefs.setString('userData', userData.toString());
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = prefs.getString('userData')!;
    // final extractedUserData = json.decode(prefs.getString('userData')!) as Map<String, Object>;
    // final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    // if (expiryDate.isBefore(DateTime.now())) {
    //   return false;
    // }
    _token = extractedUserData;
    // _userId = extractedUserData['userId'];
    notifyListeners();
    return true;
  }
}
