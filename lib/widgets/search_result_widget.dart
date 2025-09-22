import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_movies/models/movie.dart';
import 'package:top_movies/screens/details_screen/details_screen.dart';

class SearchResultWidget extends StatelessWidget {
  final Movie movie;
  const SearchResultWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    final screenH = MediaQuery.of(context).size.height;
    return Container(
      height: screenH * 0.2,
      margin: EdgeInsetsGeometry.only(bottom: 12),
      width: screenW,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.white, width: 1),
        borderRadius: BorderRadiusGeometry.all(Radius.circular(6)),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(movieId: movie.id),
            ),
          );
        },
        child: Row(
          spacing: 8,
          children: [
            Hero(
              tag: movie.title,
              child: Container(
                height: screenH * 0.2,
                width: screenW * 0.35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusGeometry.directional(
                    topStart: Radius.circular(8),
                    bottomStart: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.poster),
                  ),
                ),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    softWrap: true,
                    movie.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    spacing: 16,
                    children: [
                      Row(
                        spacing: 4,
                        children: [
                          Icon(Icons.calendar_month, color: Colors.white),

                          Text(
                            movie.year,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        spacing: 2,
                        children: [
                          Icon(Icons.star_rounded, color: Colors.white),

                          Text(
                            movie.imdbRating,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
