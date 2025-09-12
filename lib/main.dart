import 'package:flutter/material.dart';
import 'package:top_movies/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Movies',
      home: SplashScreen(),
    );
  }
}
