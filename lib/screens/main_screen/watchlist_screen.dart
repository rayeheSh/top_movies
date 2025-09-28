import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/models/movie.dart';
import 'package:top_movies/providers/watchlist_provider.dart';
import 'package:top_movies/screens/details_screen/details_screen.dart';

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
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Consumer<WatchlistProvider>(
        builder: (context, watchlistProvider, child) {
          if (watchlistProvider.watchlist.isEmpty) {
            return Center(
              child: Text(
                'Your watch list is empty',
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),
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
  final double screenW;
  final double screenH;

  const WatchlistItem({
    super.key,
    required this.movie,
    required this.screenW,
    required this.screenH,
  });

  @override
  Widget build(BuildContext context) {
    final watchlistProvider = Provider.of<WatchlistProvider>(context);
    return Dismissible(
      key: Key(movie.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.red.shade400,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(Icons.delete, color: Colors.white, size: 30),
      ),

      onDismissed: (direction) => watchlistProvider.toggleWatchlist(movie),
      child: Container(
        height: screenH * 0.18,
        margin: EdgeInsetsGeometry.only(bottom: 12),
        width: screenW,
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.white, width: 2),
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
