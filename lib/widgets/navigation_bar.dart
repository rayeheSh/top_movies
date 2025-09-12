import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationBar1 extends StatelessWidget {
  const NavigationBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: (value) {},
            iconSize: 32,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.home_outlined),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Watchlist',
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline_rounded),
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle_outlined),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
