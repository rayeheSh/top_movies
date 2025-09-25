import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/providers/detail_provider.dart';
import 'package:top_movies/providers/home_provider.dart';
import 'package:top_movies/providers/main_provider.dart';
import 'package:top_movies/providers/profile_provider.dart';
import 'package:top_movies/providers/watchlist_provider.dart';
import 'package:top_movies/screens/splash_screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WatchlistProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider()),
        ChangeNotifierProvider(create: (context) => MainProvider()),
        ChangeNotifierProvider(create: (context) => DetailProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
      ],
      child: MaterialApp(
        title: 'Top Movies',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
