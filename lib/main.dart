import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/providers/home_provider.dart';
import 'package:top_movies/providers/main_provider.dart';
import 'package:top_movies/providers/watchlist_provider.dart';
import 'package:top_movies/screens/main_screen/main_screen.dart';

void main() {
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
      ],
      child: MaterialApp(
        title: 'Top Movies',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
