import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitly/auth/auth_service.dart';
import 'package:splitly/screens/auth_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AuthService(),
      child: MaterialApp(
        title: 'Splitly',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
            bodyMedium: TextStyle(
              color: Color(0xFF555555),
            ),
          ),
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: IconThemeData(color: Color(0xFF333333)),
            titleTextStyle: GoogleFonts.poppins(
              color: Color(0xFF333333),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF333333),
            foregroundColor: Colors.white,
          ),
        ),
        home: AuthWrapper(),
      ),
    );
  }
}
