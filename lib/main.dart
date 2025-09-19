import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/providers/watchlist_provider.dart';
import 'package:top_movies/screens/main_screen/main_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
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
      ],
      child: MaterialApp(
        title: 'Top Movies',
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
