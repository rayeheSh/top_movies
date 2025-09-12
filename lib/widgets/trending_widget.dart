import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendingWidget extends StatelessWidget {
  final String title;
  final String year;
  final String img;
  const TrendingWidget({
    super.key,
    required this.title,
    required this.year,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [
        Container(
          height: 163,
          width: 120,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              year,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
