import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_movies/screens/splash_screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Top Movies',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
