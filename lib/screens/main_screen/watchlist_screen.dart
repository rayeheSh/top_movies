// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/models/movie.dart';
import 'package:top_movies/providers/watchlist_provider.dart';
import 'package:top_movies/screens/main_screen/main_screen.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Watchlist'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
        ),
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Consumer<WatchlistProvider>(
        builder: (context, watchlistProvider, child) {
          if (watchlistProvider.watchlist.isEmpty) {
            return Center(
              child: Text(
                'Your watchlist is empty.',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ListView.builder(
              itemCount: watchlistProvider.watchlist.length,
              itemBuilder: (context, index) {
                final movie = watchlistProvider.watchlist[index];
                return WatchlistItem(
                  movie: movie,
                  screenH: MediaQuery.of(context).size.height,
                  screenW: MediaQuery.of(context).size.width,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class WatchlistItem extends StatelessWidget {
  final Movie movie;
  final screenW;
  final screenH;
  const WatchlistItem({
    super.key,
    required this.movie,
    this.screenW,
    this.screenH,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenH * 0.2,
      margin: EdgeInsetsGeometry.only(bottom: 12),
      width: screenW,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.white, width: 2),
        borderRadius: BorderRadiusGeometry.all(Radius.circular(6)),
      ),
      child: Row(
        spacing: 8,
        children: [
          Container(
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

                /* Row(
                  spacing: 2,
                  children: [
                    Icon(Icons.timer_outlined, color: Colors.white),
            
                    Text(
                      '2hr 50min',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
