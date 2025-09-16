import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreWidget extends StatelessWidget {
  final dynamic lable;
  const GenreWidget({super.key, this.lable});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          lable,
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: Color.fromRGBO(0, 0, 0, 1),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
