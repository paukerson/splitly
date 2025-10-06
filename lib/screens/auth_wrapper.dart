import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitly/auth/auth_service.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return authService.isAuthenticated ? HomeScreen() : LoginScreen();
  }
}
