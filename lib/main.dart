import 'package:counter_app/providers/counter_provider.dart';
import 'package:counter_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.ribeyeMarrowTextTheme(),
        snackBarTheme: SnackBarThemeData(backgroundColor: Colors.amber[900]),
      ),
      home: HomeScreen(),
    );
  }
}
