import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/providers/main_provider.dart';
import 'package:top_movies/screens/main_screen/home_screen.dart';
import 'package:top_movies/screens/main_screen/profile_screen.dart';
import 'package:top_movies/screens/main_screen/watchlist_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> screens = [
    const HomeScreen(),
    const WatchlistScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color.fromRGBO(52, 52, 74, 1),
      ),
    );
    return Consumer<MainProvider>(
      builder: (context, provider, child) => Scaffold(
        backgroundColor: Color.fromRGBO(52, 52, 74, 1),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: screens[provider.pageIndex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(40),
              child: BottomNavigationBar(
                backgroundColor: Color.fromRGBO(38, 37, 58, 1),
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white38,
                selectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                unselectedLabelStyle: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                currentIndex: provider.pageIndex,
                onTap: (value) {
                  provider.changeNavIndex(value);
                },
                iconSize: 32,
                items: [
                  BottomNavigationBarItem(
                    label: 'Home',
                    icon: Icon(Icons.home_outlined),
                  ),
                  BottomNavigationBarItem(
                    label: 'Watchlist',
                    icon: Icon(Icons.favorite_outline_rounded),
                  ),
                  BottomNavigationBarItem(
                    label: 'Profile',
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
