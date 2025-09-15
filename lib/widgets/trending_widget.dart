import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_movies/models/movie.dart';

class TrendingWidget extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  const TrendingWidget({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 130,
        margin: EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.poster,
                height: 160,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 8),

            Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              movie.year,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
