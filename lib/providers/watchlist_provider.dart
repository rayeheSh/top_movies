import 'package:flutter/material.dart';
import 'package:top_movies/models/movie.dart';

class WatchlistProvider extends ChangeNotifier {
  final List<Movie> _watchlist = [];

  List<Movie> get watchlist => _watchlist;

  bool isMovieInWatchlist(Movie movie) {
    return _watchlist.any((m) => m.id == movie.id);
  }

  void toggleWatchlist(Movie movie) {
    if (isMovieInWatchlist(movie)) {
      _watchlist.removeWhere((m) => m.id == movie.id);
    } else {
      _watchlist.add(movie);
    }
    notifyListeners();
  }
}
