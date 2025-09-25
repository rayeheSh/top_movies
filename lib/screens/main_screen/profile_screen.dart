import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 52, 74, 1),
      body: Center(
        child: Text(
          'Profile Screen',
          style: GoogleFonts.poppins(color: Colors.white70, fontSize: 24),
        ),
      ),
    );
  }
}
