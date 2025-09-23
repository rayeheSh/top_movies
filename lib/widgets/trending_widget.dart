import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/models/movie.dart';
import 'package:top_movies/providers/watchlist_provider.dart';

class TrendingWidget extends StatefulWidget {
  final Movie movie;
  final VoidCallback onTap;
  const TrendingWidget({super.key, required this.movie, required this.onTap});
  @override
  State<TrendingWidget> createState() => _TrendingWidgetState();
}

class _TrendingWidgetState extends State<TrendingWidget> {
  @override
  Widget build(BuildContext context) {
    final watchlistProvider = Provider.of<WatchlistProvider>(context);
    final isLiked = watchlistProvider.isMovieInWatchlist(widget.movie);

    return Container(
      width: 130,
      margin: EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: widget.movie.title,
                      child: Image.network(
                        widget.movie.poster,
                        height: 160,
                        width: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    widget.movie.title,
                    softWrap: true,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  Text(
                    widget.movie.year,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () =>
                    watchlistProvider.toggleWatchlist(widget.movie),
                icon: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_outline,
                  color: isLiked ? Colors.red : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
