import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayingWidget extends StatelessWidget {
  final String img;
  final String title;
  final String rating;
  const PlayingWidget({
    super.key,
    required this.img,
    required this.title,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
          ),
        ),

        Positioned(
          top: 12,
          left: 12,
          child: Container(
            padding: EdgeInsets.only(right: 2, left: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text(
              'HD',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),

        Positioned(
          top: 12,
          right: 12,
          child: Container(
            padding: EdgeInsets.only(right: 2, left: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(2),
            ),
            child: Row(
              spacing: 2,
              children: [
                Icon(Icons.star, color: Colors.white, size: 12),
                Text(
                  rating,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 32,
          left: 12,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
